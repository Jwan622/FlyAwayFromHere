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
    @origin = origin
    @departure_date = departure_date
    @return_date = return_date
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
    cleaned_qpx_data = QPX::QPXCleaner.new(destination, origin, departure_date, return_date, max_price).clean_arguments_for_qpx
    qpx_service.search(cleaned_qpx_data[:destination],
                      cleaned_qpx_data[:origin],
                      cleaned_qpx_data[:departure_date],
                      cleaned_qpx_data[:return_date],
                      cleaned_qpx_data[:max_price]
                      )
  end
end
