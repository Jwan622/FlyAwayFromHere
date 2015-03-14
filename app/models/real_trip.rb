class RealTrip
  attr_reader :price,
              :departure_date,
              :return_date,
              :departure_city,
              :arrival_city,
              :title,
              :ranking

  def initialize(trip_data)
    @price = trip_data["saleTotal"].gsub("USD", "").to_f
    @departure_date = Time.parse(trip_data["slice"].first["segment"].first["leg"].first["departureTime"])
    @return_date = Time.parse(trip_data["slice"].first["segment"].first["leg"].first["arrivalTime"])
    @departure_city = trip_data["slice"].first["segment"].first["leg"].first["origin"]
    @arrival_city = trip_data["slice"].first["segment"].first["leg"].first["destination"]
    @ranking = rand(100)
    @title = departure_city + " " + "Trip"
    @short_description = "This is a trip to #{departure_city} from #{arrival_city}."
    @long_description = "This is where the long description should be. I'll eventually use a hash to do this but for now" +
                        "Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, blah blah."
    @departure_airline = trip_data["slice"].first["segment"].first["flight"]["carrier"]
    @return_airline = trip_data["slice"].second["segment"].first["flight"]["carrier"]
  end
end
