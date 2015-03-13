class TripSearcher
  attr_reader :origin_airport,
              :destination_airport,
              :departure_date,
              :max_price,
              :qpx_service

  def initialize(origin_airport, destination_airport, departure_date, max_price=2000000)
    @origin_airport = origin_airport
    @destination_airport = destination_airport
    @departure_date = departure_date
    @max_price = max_price
    @qpx_service = QPXService.new
  end

  def qpx_search
    qpx_service.search(origin_airport, destination_airport, departure_date, max_price)
  end

  def search
    qpx_search["trips"]["tripOption"].map do |trip_data|
      RealTrip.new(trip_data)
    end
  end
end
