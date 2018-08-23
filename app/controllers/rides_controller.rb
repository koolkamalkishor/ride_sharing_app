class RidesController < ApplicationController

  before_action :set_ride, only: [:show, :edit, :update,]
  def index
    @rides = policy_scope(Ride)
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)

    if @ride.save
      flash[:notice] = "Ride has been created.";
      redirect_to @ride
    else
      flash.now[:alert] = "Ride has not been created"
      render "new"
    end
  end


  def show
    authorize @ride, :show?
  end

  def edit
    authorize @ride, :update?
  end

  def update
    authorize @ride, :update?

    if @ride.update(ride_params)
      flash[:notice] = "Ride has been updated."
      redirect_to @ride
    else
      flash.now[:alert] = "Ride has not been updated."
      render "edit"
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:destination, :checkout, :passengers)
  end

  def set_ride
    @ride = Ride.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "the ride you were looking for could not be found."
    redirect_to rides_path
  end
end
