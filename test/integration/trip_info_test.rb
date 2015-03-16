require 'test_helper'

class TripInfoTest < ActionDispatch::IntegrationTest
  def test_it_has_price_on_the_page
    real_trip = RealTrip.new()
    trip = RealTripInfo.new(price: "$400", departure_date: "2015-03-28", return_date: "2015-04-13")
    trip_info = TripInfo.create!(title: "Aruba title",
                             city: "Aruba",
                             short_description: "Aruba short description",
                             long_description: "Aruba long description",
                             airport: "AUA",
                             )

    visit real_trip_path(trip)

    assert.page_has_content?("$400")
  end

  def test_it_has_a_title_on_the_page
    skip
  end

  def test_it_has_short_description_on_the_page
    skip
  end

  def test_it_has_long_description_on_the_page
    skip
  end
end
