require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  def test_a_user_cannot_see_trips_while_not_logged_in
    create(:category)

    visit root_path
    click_link "Delhi"

    assert page.has_content?("Your Flight is Delayed until you log in.")
  end

  def test_a_user_can_use_login_fields_to_log_in
    user = create(:user, activated: true)

    visit root_path
    log_in(as: user)

    assert page.has_content?("Welcome back to the skies flyer1")
  end

  def test_a_user_can_see_trips_while_logged_in
    user = create(:user, activated: true)
    origin = create(:category, name: "New York City")
    destination = create(:category, name: "Las Vegas")
    real_trip = RealTrip.new(QPXStubbedJSON.qpx_data["trips"]["tripOption"].first)
    FindTrip.any_instance.stubs(:find_all).returns([real_trip])

    visit root_path
    log_in(as: user)
    visit real_trips_path({ plan: { destination: "NYC", origin: "LAS", departure_date: "2015-03-29", return_date: "2015-04-18", max_price: "USD5000" } })

    assert page.has_content?("Here are your search results!")
    assert page.has_content?("#{destination.name} trip")
    assert page.has_content?("#{origin.name}")
  end

  def test_logged_in_user_can_see_trip_info_page
    user = create(:user, activated: true)
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

    visit root_path
    log_in(as: user)
    visit real_trip_path(real_trip, info: { departure_date: real_trip.departure_date, return_date: real_trip.return_date, price: real_trip.price })

    # assert_template :show # Why doesn't this work?
    assert page.has_content?("$689.95")
    assert page.has_content?("Las Vegas title")
    assert page.has_content?("Las Vegas short description")
  end

  test "a logged_in user can go from the trip info page back to the planner" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
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
    click_link "Let's Plan Again."

    assert page.has_content?("Let's plan a trip...")
  end
end
