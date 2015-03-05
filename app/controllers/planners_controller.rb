class PlannersController < ApplicationController
  def new
    @activity_categories = Category.activity_categories
  end
end
