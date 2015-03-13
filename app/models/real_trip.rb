class RealTrip
  attr_reader :price,
              :departure_date,
              :return_date,
              :departure_city,
              :arrival_city

  def initialize(trip_data)
    @price = trip_data["saleTotal"].gsub("USD", "").to_f
    @departure_date = Time.parse(trip_data["slice"].first["segment"].first["leg"].first["departureTime"])
    @return_date = Time.parse(trip_data["slice"].first["segment"].first["leg"].first["arrivalTime"])
    @departure_city = trip_data["slice"].first["segment"].first["leg"].first["origin"]
    @arrival_city = trip_data["slice"].first["segment"].first["leg"].first["destination"]
  end
end
