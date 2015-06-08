class ExperiencesController < ApplicationController


  def index
    @experiences = Experience.where(:user_id => current_user.id)


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

    @us_states =
      [
      ['AK', 'AK'],
    ['AL', 'AL'],
    ['AR', 'AR'],
    ['AZ', 'AZ'],
    ['CA', 'CA'],
    ['CO', 'CO'],
    ['CT', 'CT'],
    ['DC', 'DC'],
    ['DE', 'DE'],
    ['FL', 'FL'],
    ['GA', 'GA'],
    ['HI', 'HI'],
    ['IA', 'IA'],
    ['ID', 'ID'],
    ['IL', 'IL'],
    ['IN', 'IN'],
    ['KS', 'KS'],
    ['KY', 'KY'],
    ['LA', 'LA'],
    ['MA', 'MA'],
    ['MD', 'MD'],
    ['ME', 'ME'],
    ['MI', 'MI'],
    ['MN', 'MN'],
    ['MO', 'MO'],
    ['MS', 'MS'],
    ['MT', 'MT'],
    ['NC', 'NC'],
    ['ND', 'ND'],
    ['NE', 'NE'],
    ['NH', 'NH'],
    ['NJ', 'NJ'],
    ['NM', 'NM'],
    ['NV', 'NV'],
    ['NY', 'NY'],
    ['OH', 'OH'],
    ['OK', 'OK'],
    ['OR', 'OR'],
    ['PA', 'PA'],
    ['RI', 'RI'],
    ['SC', 'SC'],
    ['SD', 'SD'],
    ['TN', 'TN'],
    ['TX', 'TX'],
    ['UT', 'UT'],
    ['VA', 'VA'],
    ['VT', 'VT'],
    ['WA', 'WA'],
    ['WI', 'WI'],
    ['WV', 'WV'],
    ['WY', 'WY']
      ]

  def create
    @restaurants = Restaurant.all
    @experience = Experience.new
    @experience.comments = params[:comments]
    @experience.best = params[:best]
    @experience.worst = params[:worst]
    @experience.date = Chronic.parse(params[:date])
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
      @experience.destroy
      @restaurant.destroy
    else
      @experience = Experience.find(params[:id])
      @experience.destroy
    end

    redirect_to "/experiences", :notice => "Experience deleted."
  end
end

end
