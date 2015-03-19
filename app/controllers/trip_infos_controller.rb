class TripInfosController < ApplicationController
  def index
    @trip_infos = TripInfo.includes(:photos)
  end

  def show
  end
end
