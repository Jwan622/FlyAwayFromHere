require 'test_helper'

class UserResearchTest < ActionDispatch::IntegrationTest

  test "a non-logged in user cannot do anything from the root_path" do
    create(:category, name: "New York")
    user = create(:user)

    visit root_path

    click_button "Get Travel Plans"
    assert page.has_content?("Your Flight is Delayed until you log in.")

    click_link "New York"
    assert page.has_content?("Your Flight is Delayed until you log in.")

    click_link "Bargain Hunt for Me"
    assert page.has_content?("Your Flight is Delayed until you log in.")
  end

  test "a logged in user cannot click Get Travel Plans on new_planner_path
    without filling out the form completely" do
    user = create(:user)

    visit root_path
    log_in(as: user)

    click_button "Get Travel Plans"
    assert page.has_content?("Please fill out your flight preferences fully.")
  end

  test "a user can see a trip show page via links from the trips index page" do
    trip_index_setup

    click_link "Details"

    assert page.has_content?("Las Vegas title")
    assert page.has_content?("Las Vegas short description")
  end

  test "a user can click a link and go to that project's external booking
    site" do
    visit root_path
    trip_info_setup

    assert page.has_selector?(:link, "Book Ticket")
  end

  test "the trips are in price order in the trips index page" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    create(:category, name: "New York City")
    create(:category, name: "Las Vegas")
    real_trip1 = RealTrip.new(QPXStubbedJSON.qpx_data["trips"]["tripOption"].first)
    real_trip2 = RealTrip.new(QPXStubbedJSON.qpx_data["trips"]["tripOption"].first)
    real_trip3 = RealTrip.new(QPXStubbedJSON.qpx_data["trips"]["tripOption"].first)
    real_trip2.stubs(:price).returns("$1")
    real_trip3.stubs(:price).returns("$2")
    FindTrip.any_instance.stubs(:find_all).returns([real_trip1, real_trip2, real_trip3])

    visit real_trips_path({ plan: { destination: "NYC", origin: "LAS", departure_date: "2015-03-29", return_date: "2015-04-18", max_price: "USD5000" } })

    within first(".trip-row") do
      assert page.has_content?("$1")
    end

    within all(".trip-row")[2] do
      puts all(".trip-row")[2]
      assert page.has_content?("2")
    end

    within all(".trip-row").last do
      assert page.has_content?("$689.95")
    end
  end

  test "it can bargain hunt" do
    VCR.use_cassette("bargain_hunt") do
      user = create(:user)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      create(:category, name: "New York City")
      create(:category, name: "Las Vegas")
      create(:category, name: "Los Angeles")
      visit root_path

      click_link "Bargain Hunt for Me"
      prices = all(".trip-row .trip-price").map do |price|
        price.text.to_f
      end

      assert_equal real_trips_path, current_path
      assert page.has_content?("Here are your search results!")
      assert prices.none? { |price| price > 500 }
    end
  end
end
