class RealTrip
  include AirportAndCityLookupHelper

  attr_reader :price,
              :departure_date,
              :return_date,
              :departure_airline,
              :return_airline,
              :departure_city,
              :arrival_city,
              :title,
              :ranking,
              :short_description,
              :long_description

  def initialize(trip_data)
    @price = trip_data["saleTotal"].gsub("USD", "$")
    @departure_airline = trip_data["slice"].first["segment"].first["flight"]["carrier"]
    @return_airline = trip_data["slice"].second["segment"].first["flight"]["carrier"]
    @departure_date = Time.parse(trip_data["slice"].first["segment"].first["leg"].first["departureTime"])
    @return_date = Time.parse(trip_data["slice"].first["segment"].first["leg"].first["arrivalTime"])
    @departure_city = trip_data["slice"].first["segment"].first["leg"].first["origin"] || city_lookup[@departure_airline]
    @arrival_city = trip_data["slice"].first["segment"].first["leg"].first["destination"] || city_lookup[@return_airline]
    @ranking = rand(100)
    @title = departure_city + " " + "Trip"
    @short_description = "This is a trip to #{departure_city} from #{arrival_city}."
    @long_description = "This is where the long description should be. I'll eventually use a hash to do this but for now" +
                        "Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, blah blah."
  end

  def to_param
    @arrival_city
  end

  private

  def one_way_trip
    trip_data["slice"]
  end

  def plane_transfer
    ["segment"]
  end

  def stop
    ["leg"]
  end

  def airline_cleaner
    {
      "VX" => "Virgin America"
    }
  end
end
