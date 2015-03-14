class FindTrip
  attr_reader :destination,
              :origin,
              :departure_date,
              :return_date,
              :max_price,
              :qpx_service

  def initialize(destination:, origin:, departure_date:, return_date:, max_price: "5000")
    @destination = destination
    @origin = origin
    @departure_date = departure_date
    @return_date = return_date
    @max_price = max_price
    @qpx_service = QPXService.new
  end

  def find_all
    qpx_search["trips"]["tripOption"].map do |trip_data|
      RealTrip.new(trip_data)
    end
  end

  def qpx_search
    clean_arguments_for_qpx
    qpx_service.search(destination, origin, departure_date, return_date, max_price)
  end

  private

  def clean_arguments_for_qpx
    @destination = airport_lookup[destination]
    @origin = airport_lookup[origin]
    @departure_date = date_cleaner(departure_date)
    @return_date = date_cleaner(return_date)
    @max_price = price_cleaner(max_price)
  end

  def airport_lookup
    {
      "aruba"         => "AUA",
      "barcelona"     => "BCN",
      "new-york-city" => "NYC",
      "reykjavik"     => "REK",
      "kyoto"         => "UKY",
      "los-angeles"   => "LAX",
      "london"        => "LON",
      "shanghai"      => "PVG",
      "sydney"        => "SYD"
    }
  end

  def date_cleaner(unformatted_date)
    split_date = unformatted_date.split("/")
    date_object = Date.parse("#{ split_date[2] }-#{ split_date[0] }-#{ split_date[1] }")
    date_object.strftime("%Y-%m-%d")
  end

  def price_cleaner(max_price)
    "USD" + max_price
  end
end
