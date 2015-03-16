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
              :long_description,
              :trip_data

  def initialize(trip_data)
    @trip_data = trip_data
    @price = trip_data["saleTotal"].gsub("USD", "$")
    @departure_airline = city_stop.first["flight"]["carrier"]
    @return_airline = trip_data["slice"].second["segment"].first["flight"]["carrier"]
    @departure_date = Time.parse(city_stop.first["leg"].first["departureTime"])
    @return_date = Time.parse(city_stop.first["leg"].first["arrivalTime"])
    @arrival_airport = arrival_airport
    @departure_city = departure_city_name
    @arrival_city =  arrival_city_name
    @ranking = rand(100)
    @title = arrival_city_name + " " + "trip"
    @short_description = "This is a trip to #{arrival_city_name} from #{departure_city_name}."
    @long_description = "This is where the long description should be. I'll eventually use a hash to do this but for now" +
                        "Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, blah blah."
  end

  def to_param
    @arrival_airport
  end

  private

  def city_stop
    trip_data["slice"].first["segment"]
  end

  def arrival_airport
    trip_data["slice"].first["segment"].first["leg"].first["destination"]
  end

  def arrival_city_slug
    city_lookup[trip_data["slice"].first["segment"].first["leg"].first["destination"]]
  end

  def departure_city_slug
    city_lookup[trip_data["slice"].first["segment"].first["leg"].first["origin"]]
  end

  def arrival_city_name
    Category.find_by(slug: arrival_city_slug).name
  end

  def departure_city_name
    Category.find_by(slug: departure_city_slug).name
  end
end
