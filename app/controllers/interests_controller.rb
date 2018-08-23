class InterestsController < ApplicationController
  before_action :set_ride
  before_action :set_interest, only: [:show, :edit, :update, :destroy]
  def new
    @interest = @ride.interests.build
    authorize @interest, :create?
  end


  def create
    @interest = @ride.interests.build(interest_params)
    @interest.author = current_user
    authorize @interest, :create?

    if @interest.save
      flash[:notice] = "Interest has been created."
      redirect_to [@ride, @interest]
    else
      flash.now[:alert] = "Interest has not been created."
      render "new"
    end
  end

  def show
    authorize @interest, :show?
  end

  def edit
    authorize @interest, :update?
  end

  def update
    authorize @interest, :update?

    if @interest.update(interest_params)
      flash[:notice] = "Interest has been updated."
      redirect_to [@ride, @interest]
    else
      flash.now[:alert] = "Interest has not been updated."
      render "edit"
    end
  end

  def destroy
    authorize @interest, :destroy?

    @interest.destroy
    flash[:notice] = "Interest has been deleted."
    redirect_to @ride
  end


  private

  def interest_params
    params.require(:interest).permit(:name)
  end

  def set_ride
    @ride = Ride.find(params[:ride_id])
  end

  def set_interest
    @interest = @ride.interests.find(params[:id])
  end
end
