# def display_cost
#   "#{currency}#{cents_in_dollars}"
# end

class TripsPresenter
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def trips
    if data[:search_type]
      Trip.send("by_#{@data[:search_type]}", @data[:search_value])
    else
      Trip.all_by_ranking
    end
  end

  def plan
    Trip.by_plan(@data[:quality_category], @data[:location_category], @data[:activity_category])
  end

  def filterz
    Trip.by_filter(@data)
  end
end
