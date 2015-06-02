require 'open-uri'
require 'JSON'

class RestaurantsController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @restaurants = Restaurant.all
    @experiences = Experience.all



  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @experiences = Experience.all


    # @place = "#{@restaurant.venue_name} chicago"
    # @safe_place = URI.encode(@place)
    # url_coord = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@safe_place}&"


    # parsed_data_coord = JSON.parse(open(url_coord).read)

    # @lat = parsed_data_coord["results"][0]["geometry"]["location"]["lat"]

    # @lng = parsed_data_coord["results"][0]["geometry"]["location"]["lng"]

  end

  def new
    @restaurant = Restaurant.new
    @experiences = Experience.all
  end




  def create
    @restaurant = Restaurant.new
    venue_name = params[:venue_name].split(' ')
    venue_name = venue_name.map(&:capitalize).join(' ')
    @restaurant.venue_name = venue_name
    @experiences = Experience.all

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

    if @restaurant.save
      redirect_to "/restaurants", :notice => "Restaurant updated successfully."
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
