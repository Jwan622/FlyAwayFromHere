class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
  end

  def create
  end
end
