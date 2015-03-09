class TripsController < ApplicationController
  def index
    if params[:activity]
      @trips = Trip.joins(:categories).where("categories.slug = ?", params[:activity])
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

  def trip_categories_params
    params.require(:activity).permit(:activity)
  end
end
