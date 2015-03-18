module SetupForTripInfoPage
  def trip_info_setup
    log_in
    create(:category, name: "New York City")
    las_vegas = create(:category, name: "Las Vegas")
    real_trip = RealTrip.new(QPXStubbedJSON.qpx_data["trips"]["tripOption"].first)
    trip_info = TripInfo.create!(title: "Las Vegas title",
                             city: "Las Vegas",
                             short_description: "Las Vegas short description",
                             long_description: "Las Vegas long description",
                             airport: "LAS"
                             )
    trip_info.photos << create(:photo)

    visit real_trip_path(real_trip, info: { departure_date: real_trip.departure_date, return_date: real_trip.return_date, price: real_trip.price })
  end
end
