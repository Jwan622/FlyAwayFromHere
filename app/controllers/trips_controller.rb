class TripsController < ApplicationController

  def index
    @trips = TripsPresenter.new(params).trips
  end

  def new
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
