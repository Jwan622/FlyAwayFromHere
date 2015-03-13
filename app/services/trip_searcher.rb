class TripSearcher
  attr_reader :destination,
              :origin,
              :departure_date,
              :return_date,
              :max_price,
              :qpx_service

  def initialize(destination:, origin:, departure_date:, return_date:, max_price: "$USD5000")
    @destination = destination
    @origin = origin
    @departure_date = departure_date
    @return_date = return_date
    @max_price = max_price
    @qpx_service = QPXService.new
  end

  def clean_arguments_for_qpx
    @destination = clean_destination(destination)
  end

  def qpx_search
    clean_arguments_for_qpx
    qpx_service.search(destination, origin, departure_date, return_date, max_price)
  end

  def find_all
    qpx_search["trips"]["tripOption"].map do |trip_data|
      RealTrip.new(trip_data)
    end
  end

  private
  
  def clean_destination(destination)
    destinations[:destination]
  end

  def destinations
    {
      aruba: "Oranjestad",
      barcalona: "Barcalona",
      new_york: "New York City",

    }
  end
end
