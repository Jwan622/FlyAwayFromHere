class PlannersController < ApplicationController
  def new
    @activity_categories = Category.activity_categories
    @location_categories = Category.location_categories
  end
end
