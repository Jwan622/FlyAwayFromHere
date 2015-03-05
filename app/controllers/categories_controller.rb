class CategoriesController < ApplicationController
  def index
    @categories = Category.select(:quality_categories, :proximity_categories, :activity_categories).all
  end
end
