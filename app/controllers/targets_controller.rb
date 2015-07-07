class TargetsController < ApplicationController
  def index
    @targets = Target.all
  end

  def show
    @target = Target.find(params[:id])
  end

  def new
    @target = Target.new
    @restaurants = Restaurant.all

  end

  def create
    @restaurants = Restaurant.all
    @target = Target.new
    @target.restaurant_id = params[:restaurant_id]
    @target.user_id = current_user.id

    if @target.save
      redirect_to "/targets", :notice => "Target created successfully."
    else
      render 'new'
    end
  end

  def edit
    @target = Target.find(params[:id])
  end

  def update
    @target = Target.find(params[:id])

    @target.restaurant_id = params[:restaurant_id]
    @target.user_id = params[:user_id]

    if @target.save
      redirect_to "/targets", :notice => "Target updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @target = Target.find(params[:id])

    @target.destroy

    redirect_to "/targets", :notice => "Target deleted."
  end
end
