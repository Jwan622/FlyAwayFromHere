require 'test_helper'

class UserResearchTest < ActionDispatch::IntegrationTest

  test "a non-logged in user cannot do anything from the root_path" do
    user = create(:user)

    visit root_path
    log_in(user)

    click_button "Get Travel Plans"
    assert page.has_content?("Your Flight is Delayed until you log in.")

    click_link "New York"
    assert page.has_content?("Your Flight is Delayed until you log in.")

    click_link "Bargain Hunt For Me"
    assert page.has_content?("Your Flight is Delayed until you log in.")
  end

  test "a user can see a trip show page via links from the trips index page" do
    skip
    trip = create(:trip)

    visit trips_path
    click_link "Select"

    assert page.has_content?("Iceland Escape1")
  end

  test "a user can click a link and go to that project's external booking
    site" do
    skip
    trip = create(:trip, external_site: "Kayak")

    assert page has.content?("Kayak")
  end

  test "the trips are in rank order in the trips index page" do
    skip
    trip = create(:trip)
    trip2 = create(:trip)

    visit trips_path
    save_and_open_page

    assert page.has_content?("1")
    assert page.has_content?("2")

  end

  test "a user visits home and clicks Bargain Hunt option and sees trips on the
    next page under $400 round trip in rank order" do
    skip
  end
end
