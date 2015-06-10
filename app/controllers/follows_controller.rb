class FollowsController < ApplicationController
  def index

    follows2 = Follow.where :sender_id => current_user

    follows2.each do |follow|
      if follow.receiver == nil
        follow.destroy
      end

    @follows = Follow.where :sender_id => current_user.id


    end


  end

  def show
    @follow = Follow.find(params[:id])
  end

  def new
    @follow = Follow.new

  end

  def create
    @follow = Follow.new
    @follow.sender_id = current_user.id
    @follow.receiver_id = params[:receiver_id]

    if @follow.save
      redirect_to "/follows", :notice => "Follow created successfully."
    else
      render 'new'
    end
  end

  def edit
    @follow = Follow.find(params[:id])
  end

  def update
    @follow = Follow.find(params[:id])

    @follow.sender_id = current_user.id
    @follow.receiver_id = params[:receiver_id]

    if @follow.save
      redirect_to "/follows", :notice => "Follow updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @follow = Follow.find(params[:id])

    @follow.destroy

    redirect_to "/follows", :notice => "Follow deleted."
  end
end
