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
  test "a user can see a trips index page via links from root path" do
    skip
    create(:trip)

    visit root_path
    click_link "Ice and Snow Trek"

    assert page.has_content?("Iceland Escape1")
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

  test "a user visits home and clicks on the beaches and sunshine category and
    only sees trips on the next page associated with beaches" do
    skip
    #needs login helper. This should only be for logged in users.
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
    skip
    #this needs to be for a logged in user.
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
    skip
    trip = create(:trip)
    trip2 = create(:trip)

    visit trips_path
    save_and_open_page

    assert page.has_content?("1")
    assert page.has_content?("2")

  end

  test "a user visits trips index and sees the trips in rank order" do
    skip
    trip = create(:trip, title: "second ranked", upvotes: 20, downvotes: 10)
    trip1 = create(:trip, title: "third ranked", upvotes: 19, downvotes: 10)
    trip2 = create(:trip, title: "highest ranked", upvotes: 21, downvotes: 10)

    visit trips_path
    save_and_open_page

    assert page.first("#trip-title").has_content?(trip2.title)
    assert page.all("#trip-title").last.has_content?(trip1.title)
  end

  test "a user visits home and clicks on the beaches cateogory and sees trips
    on the next page associated with beaches in rank order" do
    skip
    user = create(:user)
    trip = create(:trip, title: "first ranked", upvotes: 20, downvotes: 10)
    trip1 = create(:trip, title: "second ranked", upvotes: 19, downvotes: 10)
    trip.categories = [Category.create(name: "New York City",
                                type: "Activity",
                                photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/default.jpg"))])]


  end

  test "a user visits home and clicks Bargain Hunt option and sees trips on the
    next page under $400 round trip in rank order" do
    skip
  end
end
