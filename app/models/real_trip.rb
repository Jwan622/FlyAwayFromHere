class RealTrip
  include AirportAndCityLookupHelper

  attr_reader :trip_data

  def initialize(trip_data)
    @trip_data = trip_data
  end

  def price
    trip_data["saleTotal"].gsub("USD", "$")
  end

  def departure_airline
    outbound_trip.first["flight"]["carrier"]
  end

  def return_airline
    trip_data["slice"].second["segment"].first["flight"]["carrier"]
  end

  def departure_date
    Time.parse(outbound_trip.first["leg"].first["departureTime"]).strftime("%b %d, %Y, %I:%M")
  end

  def return_date
    Time.parse(return_trip.first["leg"].first["departureTime"]).strftime("%b %d, %Y, %I:%M")
  end

  def departure_city
    Category.find_by(slug: departure_city_slug).name
  end

  def arrival_city
    Category.find_by(slug: arrival_city_slug).name
  end

  def title
    arrival_city + " " + "trip"
  end

  def short_description
    "This is a trip to #{arrival_city} from #{departure_city}."
  end

  def long_description
    "This is where the long description should be. I'll eventually use a hash to do this but for now" +
    "Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, blah blah."
  end

  def to_param
    arrival_airport
  end

  private

  def outbound_trip
    trip_data["slice"].first["segment"]
  end

  def return_trip
    trip_data["slice"].second["segment"]
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
end
