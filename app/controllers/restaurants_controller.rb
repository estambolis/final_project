require 'open-uri'
require 'JSON'
require 'factual'

class RestaurantsController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @restaurants = Restaurant.all
    @experiences = Experience.all

  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @experiences = Experience.all


    place = "#{@restaurant.address} #{@restaurant.city} #{@restaurant.state}"
    safe_place = URI.encode(place)
    url_coord = "http://maps.googleapis.com/maps/api/geocode/json?address=#{safe_place}&"

    parsed_data_coord = JSON.parse(open(url_coord).read)

    @lat = parsed_data_coord["results"].present? ?
    parsed_data_coord["results"][0]["geometry"]["location"]["lat"] : parsed_data_coord["results"]

    @lng = parsed_data_coord["results"].present? ?
    parsed_data_coord["results"][0]["geometry"]["location"]["lng"] : parsed_data_coord["results"]


  end

  def new

  end




  def create
    @restaurant = Restaurant.new
    venue_name = params[:venue_name].split(' ')
    venue_name = venue_name.map(&:capitalize).join(' ')
    @restaurant.venue_name = venue_name
    @experiences = Experience.all



     factual = Factual.new("Kxa1eA6u24jMllpv2EuhQtPse084AWMZ2pnTuNoN","20kMPivt9eJwzt2SLYHNPSWosrtcYkw3jpqG83ng")


    if results = factual.table("places-us").search("#{@restaurant.venue_name}").filters("$and" => [{"category_ids" => {"$includes" => 338}}, {"region" => params[:state]}]).rows != []

      results = factual.table("places-us").search("#{@restaurant.venue_name}").filters("$and" => [{"category_ids" => {"$includes" => 338}}, {"region" => params[:state]}]).rows

      @restaurant.venue_name = results[0]["name"]
      @restaurant.address = results[0]["address"]
      @restaurant.city = results[0]["locality"]
      @restaurant.state = results[0]["region"]
      @restaurant.food_type = results[0]["category_labels"][0][3]


    else

      @restaurant.address = "Unavailable"

    end




    if @restaurant.save
      redirect_to "/experiences/new", :notice => "Restaurant created successfully."
    else
      redirect_to "/experiences/new", :alert => "This restaurant already exists"
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    @experiences = Experience.all
  end

  def update
    @experiences = Experience.all
    @restaurant = Restaurant.find(params[:id])

    @restaurant.venue_name = params[:venue_name]

    @restaurant.food_type = params[:food_type]

    @restaurant.address = params[:address]

    @restaurant.city = params[:city]

    @restaurant.state = params[:state]



    if @restaurant.save
      redirect_to "/restaurants/#{@restaurant.id}", :notice => "Restaurant updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    redirect_to "/restaurants", :notice => "Restaurant deleted."
  end
end
