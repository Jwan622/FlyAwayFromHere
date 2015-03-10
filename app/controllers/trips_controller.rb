class TripsController < ApplicationController
  def index
    if params[:category]
      @trips = Trip.joins(:categories).where("categories.slug = ?", params[:category])
    else
      @trips = Trip.includes(:categories).all
    end
  end

  def new
  end

  def create
    redirect_to trips_path
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trips_params
    params.require()
  end
end
