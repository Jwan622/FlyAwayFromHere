require 'test_helper'

class RealTripTest < ActiveSupport::TestCase
  include AirportAndCityLookupHelper
  attr_reader :real_trip

  def setup
    trip_data = QPXStubbedJSON.qpx_data["trips"]["tripOption"].first
    @real_trip = RealTrip.new(trip_data)
    create(:category, name: "New York City")
    create(:category, name: "Las Vegas")
  end

  test "it must have a price" do
    assert_equal "$689.95", real_trip.price
  end

  test "it has a departure airline" do
    assert_equal "B6", real_trip.departure_airline
  end

  test "it has a return airline" do
    assert_equal "B6", real_trip.return_airline
  end

  test "it has a departure date" do
    assert_equal "Mar 29, 2015, 09:55", real_trip.departure_date
  end

  test "it has a return date" do
    assert_equal "Apr 19, 2015, 12:07", real_trip.return_date
  end

  test "it has a departure city" do
    assert_equal "New York City", real_trip.departure_city
  end

  test "it has a arrival city" do
    assert_equal "Las Vegas", real_trip.arrival_city
  end

  test "it has a title" do
    assert_equal "Las Vegas trip", real_trip.title
  end

  test "it has a short description" do
    assert_equal "This is a trip to Las Vegas from New York City.", real_trip.short_description
  end

  test "it has a long description" do
    assert_equal "This is where the long description should be. I'll eventually use a hash to do this but for nowLorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, blah blah.", real_trip.long_description
  end

  test "its id is an airport" do
    assert_equal "LAS", real_trip.to_param
  end
end
