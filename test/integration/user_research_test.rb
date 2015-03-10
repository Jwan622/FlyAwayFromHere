require 'test_helper'

class UserResearchTest < ActionDispatch::IntegrationTest

  test "a user can see a trips index page via links from root path" do
    create(:trip)

    visit root_path
    click_link "Ice and Snow Trek"

    assert page.has_content?("Iceland Escape1")
  end

  test "a user can see a trip show page via links from the trips index page" do
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

  test "a user visits home and clicks on the beaches and sunshine category and
    only sees trips on the next page associated with beaches" do
    trip1 = create(:trip)
    trip2 = create(:trip,
                   title: "Aruba Vacation")
    trip2.categories = [Category.create(name: "Beaches and Bubbly",
                                type: "Activity",
                                photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/default.jpg"))])]

    visit root_path
    within(".welcome-bottom") do
      first(:link, "Ice and Snow Trek").click
    end

    refute page.has_content?("Aruba Vacation")
  end

  test "a user visits home and clicks on the New York category adn sees trips
    on the next page to New York from the user's location." do
    trip = create(:trip,
                   title: "New York City Trip")
    trip.categories = [Category.create(name: "New York City",
                                type: "Activity",
                                photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/default.jpg"))])]

    visit root_path
    within(".welcome-bottom") do
      first(:link, "New York City").click
    end

    assert page.has_content?("New York City Trip")
  end

  test "the trips are in rank order in the trips index page" do
    trip = create(:trip)
    trip2 = create(:trip)

    visit trips_path
    save_and_open_page

    assert page.has_content?("1")
    assert page.has_content?("2")

  end
  test "a user visits home and clicks on the beaches cateogory and sees trips
    on the next page associated with beaches in rank order" do
    skip
  end

  test "a user visits home and clicks Bargain Hunt option and sees trips on the
    next page under $400 round trip in rank order" do
    skip
  end

end
