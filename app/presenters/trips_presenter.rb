class TripsPresenter
  def initialize(data)
    @data = data
  end

  def trips
    Trip.send("by_#{data[:search_type]}")
  end
end
