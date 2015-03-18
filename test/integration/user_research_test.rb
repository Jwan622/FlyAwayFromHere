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

  test "the trips are in rank order in the trips index page" do
    skip
    trip = create(:trip)
    trip2 = create(:trip)

    visit trips_path

    assert page.has_content?("1")
    assert page.has_content?("2")
  end

  test "a user visits home and clicks Bargain Hunt option and sees trips on the
    next page under $400 round trip in rank order" do
    skip
  end
end
