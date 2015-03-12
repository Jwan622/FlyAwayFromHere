class TripsController < ApplicationController

  def index
    if params[:plan] && plan_params.values.all? { |value| !value.empty? }
      @trips = TripsPresenter.new(plan_params).plan
      @categories = Category.select(:name).all
    elsif params[:plan] && plan_params.values.all? { |value| value.empty? }
      redirect_to new_planner_path, flash: { error: "You need to make a valid selection." }
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
    params.require(:plan).permit(:quality_category, :location_category, :activity_category)
  end
end
