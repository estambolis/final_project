class ExperiencesController < ApplicationController


  def index
    @experiences = Experience.where(:user_id => current_user.id)


  end

  def show
    @experience = Experience.find(params[:id])
    @experiences = Experience.all
  end

  def new
    @current_time = Time.new.strftime("%m-%d-%Y")
    @time = Chronic.parse(params[:date])
    @experience = Experience.new
    @restaurant = Restaurant.new
    @experiences = Experience.all
    @restaurants = Restaurant.all
  end

  def create
    @restaurants = Restaurant.all
    @experiences = Experience.all
    @experience = Experience.new
    @experience.comments = params[:comments]
    @experience.best = params[:best]
    @experience.worst = params[:worst]
    @experience.date = params[:date]
    @experience.rating = params[:rating]
    @experience.restaurant_id = params[:restaurant_id]
    @experience.user_id = current_user.id

    if @experience.save
      redirect_to "/experiences", :notice => "Experience created successfully."
    else
      render 'new'
    end
  end

  def edit
    @experience = Experience.find(params[:id])
    @experiences = Experience.all
  end

  def update
    @experiences = Experience.all
    @experience = Experience.find(params[:id])

    @experience.comments = params[:comments]
    @experience.best = params[:best]
    @experience.worst = params[:worst]
    @experience.date = params[:date]
    @experience.rating = params[:rating]
    @experience.restaurant_id = params[:restaurant_id]
    @experience.user_id = params[:user_id]

    if @experience.save
      redirect_to "/experiences", :notice => "Experience updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])

    if @restaurant.experiences.count == 1
      @experience = Experience.find(params[:id])
      @experience.destroy
      @restaurant.destroy
    else
      @experience = Experience.find(params[:id])
      @experience.destroy
    end

    redirect_to "/experiences", :notice => "Experience deleted."
  end
end
