class RealTripsController < ApplicationController
  before_action :require_login, only: [:index, :show]

  def index
    if planner_params_incomplete?
      redirect_to new_planner_path, flash: { error: "Please fill out your flight preferences fully."}
    else
      trips = FindTrip.new(trip_search_params).find_all
      if trips.present?
        @trips = TripsPresenter.new(trips).rank
        @categories = Category.select(:slug, :name)
      else
        @trips = []
        @categories = Category.select(:slug, :name)
      end
    end
    #
    # if params[:plan] && plan_params.values.all? { |value| !value.empty? }
    #   @trips = TripsPresenter.new(plan_params).plan
    #   @categories = Category.select(:name).all
    # elsif params[:plan] && plan_params.values.all? { |value| value.empty? }
    #   redirect_to new_planner_path, flash: { error: "You need to make a valid selection." }
    # elsif params[:categories]
    #   @trips = FindTrip.new(destination: "BOS", origin: "LAS", departure_date: "2015-03-23", return_date: "2015-03-28", max_price: "2999").find_all
    #   respond_with @trips
    # else
    #   @trips = TripsPresenter.new(params).trips
    #   @categories = Category.select(:name).all
    # end
  end

  def new
  end

  def show
    @trip_info = TripInfo.find(params[:id])
    @real_trip_info = RealTripInfo.new(real_trip_params)
  end

  private

  def planner_params_incomplete?
    params[:plan][:destination].blank? ||
    params[:plan][:origin].blank? ||
    params[:plan][:departure_date].blank? ||
    params[:plan][:return_date].blank? ||
    params[:plan][:max_price].blank?
  end

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

  def real_trip_params
    params.require(:info).permit(:departure_date, :return_date, :price).symbolize_keys
  end
end
