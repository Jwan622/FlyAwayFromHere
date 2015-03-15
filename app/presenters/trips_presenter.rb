#I can rank trips here
class TripsPresenter
  attr_reader :real_trips

  def initialize(real_trips)
    @real_trips = real_trips
  end

  def rank
    real_trips.sort_by { |real_trip| real_trip.price }
  end

  def trips
    if real_trips[:search_type]
      Trip.send("by_#{@real_trips[:search_type]}", @real_trips[:search_value])
    else
      Trip.all_by_ranking
    end
  end

  def plan
    Trip.by_plan(@real_trips[:quality_category], @real_trips[:location_category], @real_trips[:activity_category])
  end

  def filterz
    Trip.by_filter(@real_trips)
  end
end
