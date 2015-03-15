class PlannersController < ApplicationController
  def new
    @location_categories = Category.location_categories
  end
end
