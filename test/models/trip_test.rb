require 'test_helper'

class TripTest < ActiveSupport::TestCase

  test "it is valid" do
    trip = create(:trip)

    assert trip.valid?
  end

  test "it cannot have an empty string a a title" do
    trip = create(:trip)
    trip.title = nil

    refute trip.valid?
  end

  test "a trip's title must be unique" do
    trip = create(:trip, title: "A trip")
    trip1 = build(:trip, title: "A trip")

    refute trip1.valid?
  end

  test "it must have a price" do
    trip = create(:trip)
    trip.price = ""

    refute trip.valid?
  end

  test "it must have a short-description" do
    trip = create(:trip)
    trip.short_description = ""

    refute trip.valid?
  end



  test "it has a minimum price of $40" do
    trip1 = create(:trip, price: 4000)
    trip2 = build(:trip, price: 4001)

    assert trip1.valid?
    refute trip2.valid?
  end

  test "it must have at least one category" do
    trip = build(:trip, categories: [])

    refute trip.valid?
  end

  test "it can have multiple categories" do
    categories = []
    3.times do
      categories << create(:category)
    end
    trip = create(:trip)
    trip.categories = categories

    assert_equal 3, trip.categories.count
  end

  test "it has a photo by default" do
    trip = create(:trip)
    trip2 = create(:trip)
    trip2.photos = []

    assert_equal 1, trip.photos.count
    refute trip2.valid?
  end

  test "the ranking algo works" do
    trip = create(:trip, upvotes: 20, downvotes: 10)
    trip1 = create(:trip, upvotes: 19, downvotes: 10)
    trip2 = create(:trip, upvotes: 21, downvotes: 10)

    assert_equal trip.ranking, 2.0
    assert_equal trip1.ranking, 1.9
    assert_equal trip2.ranking, 2.1
  end

end
