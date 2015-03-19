class FindTrip
  include AirportAndCityLookupHelper

  attr_reader :destination,
              :cleaned_destination,
              :origin,
              :cleaned_origin,
              :departure_date,
              :cleaned_departure_date,
              :return_date,
              :cleaned_return_date,
              :max_price,
              :all_trips,
              :qpx_service

  def initialize(destination:, origin:, departure_date:, return_date:, max_price: "5000")
    @destination = destination
    @cleaned_destination = ""
    @origin = origin
    @cleaned_origin = ""
    @departure_date = departure_date
    @cleaned_departure_date = ""
    @return_date = return_date
    @cleaned_return_date = ""
    @max_price = max_price
    @qpx_service = QPXService.new
  end

  def find_all
    if qpx_data = qpx_search["trips"]["tripOption"]
      qpx_data.map do |trip_data|
        RealTrip.new(trip_data)
      end
    else
      []
    end
  end

  def bargains
    all_bargain_trips = Category.location_categories.map do |category|
      @destination = category.slug
      find_all
    end
    all_bargain_trips
  end

  private

  def qpx_search
    clean_arguments_for_qpx
    require 'pry' ; binding.pry
    qpx_service.search(cleaned_destination, cleaned_origin, cleaned_departure_date, cleaned_return_date, max_price)
  end

  def clean_arguments_for_qpx
    @cleaned_destination = airport_lookup[destination]
    @cleaned_origin = airport_lookup[origin]
    @cleaned_departure_date = date_cleaner(departure_date)
    @cleaned_return_date = date_cleaner(return_date)
    @max_price = price_cleaner(max_price)
  end

  def date_cleaner(unformatted_date)
    if already_in_date_parse_able_format(unformatted_date)
      Date.parse(unformatted_date).strftime("%Y-%m-%d")
    else
      split_date = unformatted_date.split("/")
      date_object = Date.parse("#{ split_date[2] }-#{ split_date[0] }-#{ split_date[1] }")
      date_object.strftime("%Y-%m-%d")
    end
  end

  def price_cleaner(max_price)
    if max_price[0..5] == "USDUSD"
      max_price.gsub("USDUSD", "USD")
    elsif max_price[0..2] == "USD"
      max_price
    else
      max_price.prepend("USD")
    end
  end

  def already_in_date_parse_able_format(unformatted_date)
    unformatted_date[-3..-1] == "UTC"
  end
end
