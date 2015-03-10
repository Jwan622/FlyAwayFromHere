class TripsController < ApplicationController
  def index
    if params[:category]
      @trips = Trip.sort_by_category(params[:category])
      # @trips = Trip.includes(:categories).where("categories.slug = ?", search).order(:ranking).references(:categories)
    elsif params[:price_level]
      @trips = Trip.bargain_for_user(params[:price_level])
    else
      @trips = Trip.all_trips_by_ranking
      require 'pry' ; binding.pry
    end
  end

  def new
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
