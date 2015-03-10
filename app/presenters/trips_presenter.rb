class TripsPresenter
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def trips
    if data[:search_type] != "all_projects"
      Trip.send("by_#{@data[:search_type]}", @data[:search_value])
    else
      Trip.all_by_ranking
    end
  end
end
