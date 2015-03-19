class TripsPresenter
  attr_reader :real_trips

  def initialize(real_trips)
    @real_trips = real_trips
  end

  def ordered_by_price
    real_trips.sort_by { |real_trip| real_trip.price }
  end
end
