class PlannersController < ApplicationController
  def new
    @categories = Category.all
  end
end
