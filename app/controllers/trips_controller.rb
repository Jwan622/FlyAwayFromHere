class TripsController < ApplicationController
  respond_to :json

  def index
    trips = FindTrip.new(trip_search_params).find_all
    require 'pry' ; binding.pry
    @trips = trips.map { |trip| TripsPresenter.new(trip) }

    if params[:plan] && plan_params.values.all? { |value| !value.empty? }
      @trips = TripsPresenter.new(plan_params).plan
      @categories = Category.select(:name).all
    elsif params[:plan] && plan_params.values.all? { |value| value.empty? }
      redirect_to new_planner_path, flash: { error: "You need to make a valid selection." }
    elsif params[:categories]
      @trips = FindTrip.new(destination: "BOS", origin: "LAS", departure_date: "2015-03-23", return_date: "2015-03-28", max_price: "2999").find_all
      respond_with @trips
    else
      @trips = TripsPresenter.new(params).trips
      @categories = Category.select(:name).all
    end
  end

  def new
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def plan_params
    params.require(:plan).permit(:destination, :origin, :departure_date, :return_date, :max_price)
  end

  def trip_search_params
    if params[:plan]
      plan_params.symbolize_keys
    elsif params[:category]
      category_params
    elsif params[:trip]
      trip_params
    end
  end
end
