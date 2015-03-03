class Itinerary < ActiveRecord::Base

  def initialize(itinerary)
    @itinerary = itinerary
  end

  def present?
    @itinerary.present?
  end
end
