class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
  end

  def create
    redirect_to trips_path
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
