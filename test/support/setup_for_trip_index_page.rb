module SetupForTripIndexPage
  def trip_index_setup
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    create(:category, name: "New York City")
    create(:category, name: "Las Vegas")
    real_trip = RealTrip.new(QPXStubbedJSON.qpx_data["trips"]["tripOption"].first)
    FindTrip.any_instance.stubs(:find_all).returns([real_trip])

    visit real_trips_path({ plan: { destination: "NYC", origin: "LAS", departure_date: "2015-03-29", return_date: "2015-04-18", max_price: "USD5000" } })
  end

end
