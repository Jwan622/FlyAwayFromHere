class BargainerController < ApplicationController

  def index

  end

  def create
    redirect_to bargains_path
  end
end
