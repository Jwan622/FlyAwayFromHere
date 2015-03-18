module SetupForTripIndexPage
  def trip_index_setup
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    create(:category, name: "New York City")
    create(:category, name: "Las Vegas")
    real_trip = RealTrip.new(QPXStubbedJSON.qpx_data["trips"]["tripOption"].first)
    FindTrip.any_instance.stubs(:find_all).returns([real_trip])
    trip_info = TripInfo.create!(title: "Las Vegas title",
                             city: "Las Vegas",
                             short_description: "Las Vegas short description",
                             long_description: "Las Vegas long description",
                             airport: "LAS"
                             )
    trip_info.photos << create(:photo)

    visit real_trips_path({ plan: { destination: "NYC", origin: "LAS", departure_date: "2015-03-29", return_date: "2015-04-18", max_price: "USD5000" } })
  end
end
