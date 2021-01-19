class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
    @user = current_user
  end

  def create
    user = current_user
    @ride = user.rides.create(ride_params)
    respond_to do |format|
      if @ride.save
        format.html { redirect_to "/rides", notice: 'Your ride was successfully created.' }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { render :new }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def update
    ride = Ride.find(params[:id])
    ride.update(ride_params)

    ride.save

    redirect_to "/rides/#{ride.id}"
  end

  def destroy
    ride = Ride.find(params[:id])
    ride.destroy
    redirect_to "/rides"
  end

  private

  def ride_params
    params.permit(:date, :duration, :distance, :average_speed)
  end
end
