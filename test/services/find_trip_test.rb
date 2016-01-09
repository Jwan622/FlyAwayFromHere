require 'test_helper'

class FindTripTest < ActiveSupport::TestCase
  def test_find_all_method_returns_array_of_real_trips
    create(:category, name: "Las Vegas")
    create(:category, name: "New York City")

    VCR.use_cassette("find_trip", :re_record_interval => 25.days) do
      trip_finder = FindTrip.new({destination: "las-vegas",
                            origin: "new-york-city",
                            departure_date: "2016-01-29 19:01:08 UTC",
                            return_date: "2016-02-13 19:01:08 UTC",
                            max_price: "USD500"
                            })
      found_trips = trip_finder.find_all

      found_trips.each do |found_trip|
        assert_equal "Las Vegas", found_trip.arrival_city
        assert_equal "New York City", found_trip.departure_city
        assert_operator 500, :>, found_trip.trip_data["saleTotal"][3..-1].to_i
      end
    end
  end
end
