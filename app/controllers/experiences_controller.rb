class ExperiencesController < ApplicationController


  def index
    @experiences = current_user.experiences.order("created_at DESC")


  end

  def show
    @experience = Experience.find(params[:id])




  end

  def new
    @current_time = Time.new.strftime("%m-%d-%Y")
    @experience = Experience.new
    @restaurant = Restaurant.new
    @experiences = Experience.all
    @restaurants = Restaurant.all

  def create
    @restaurants = Restaurant.all
    @experience = Experience.new
    @experience.comments = params[:comments]
    @experience.best = params[:best]
    @experience.worst = params[:worst]
    @experience.date = Chronic.parse(params[:date])
    @experience.rating = params[:rating]
    @experience.image = params[:image]
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
  end

  def update
    @experience = Experience.find(params[:id])

    @experience.comments = params[:comments]
    @experience.best = params[:best]
    @experience.worst = params[:worst]
    @experience.date = params[:date]
    @experience.rating = params[:rating]
    @experience.image = params[:image]
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
      @experience.remove_image!

      @experience.destroy
      @restaurant.destroy
    else
      @experience = Experience.find(params[:id])
      @experience.remove_image!
      @experience.destroy
    end

    redirect_to "/experiences", :notice => "Experience deleted."
  end
end

end
