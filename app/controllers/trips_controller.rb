class TripsController < ApplicationController
  def index
    @trips = Trip.trip_displayer(params)
    # @trips = TripPresenter.new(params).trips
  end

  def new
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
