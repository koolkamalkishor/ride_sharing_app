class Admin::RidesController < Admin::ApplicationController
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

  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy

    flash[:notice] = "Ride has been deleted."
    redirect_to rides_path
  end

  private

  def ride_params
    params.require(:ride).permit(:destination, :checkout, :passengers)
  end
end
