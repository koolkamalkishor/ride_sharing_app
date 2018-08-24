class RidesController < ApplicationController

  before_action :set_ride, only: [:show, :edit, :update,]
  before_action :set_rides, only: [:index]
  def index
    @rides = policy_scope(Ride)
    @user = current_user
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

  def add_ride
    @user = current_user
    User.transaction do
      @user.roles.clear
      role_data = params.fetch(:roles, [])
      role_data.each do |ride_id, role_name|
        if role_name.present?
          @user.roles.build(ride_id: ride_id, role: role_name)
        end
      end
      if !@user.save
        flash.now[:alert] = "User has not been updated."
        raise ActiveRecord::Rollback
      end
      redirect_to rides_path
    end
  end

  private

  def set_rides
    @all_rides = Ride.order(:destination)
  end

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
