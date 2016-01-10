require 'test_helper'

class QPXServiceTest < ActiveSupport::TestCase
  def test_raw_qpx_data_has_necessary_fields_to_create_real_trip_objects_using_stubbs
    QPXService.any_instance.stubs(:search).returns(JSON.parse(QPXStubbedJSON.qpx_data.to_json))
    trip_data = QPXService.new.search
    price = trip_data["trips"]["tripOption"].first["saleTotal"].gsub("USD", "$")
    departure_date = trip_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["departureTime"]
    arrival_date = trip_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["arrivalTime"]
    departure_airline = trip_data["trips"]["tripOption"].first["slice"].first["segment"].first["flight"]["carrier"]
    arrival_city = trip_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["destination"]
    origin_city = trip_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["origin"]

    assert_equal "$689.95", price
    assert_equal "2015-03-29T09:55-04:00", departure_date
    assert_equal "2015-03-29T12:45-07:00", arrival_date
    assert_equal "B6", departure_airline
    assert_equal "LAS", arrival_city
    assert_equal "JFK", origin_city
  end

  def test_raw_qpx_data_has_necessary_fields_to_create_real_trips_objects_using_vcr
    VCR.use_cassette("qpx_search", :re_record_interval => 90.days) do
      flight_data = QPXService.new.search("NYC", "LAS", "2016-02-28", "2016-03-13", "USD4000")
      price = flight_data["trips"]["tripOption"].first["saleTotal"].gsub("USD", "$")
      departure_date = flight_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["departureTime"]
      arrival_date = flight_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["arrivalTime"]
      departure_airline = flight_data["trips"]["tripOption"].first["slice"].first["segment"].first["flight"]["carrier"]
      arrival_city = flight_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["destination"]
      origin_city = flight_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["origin"]

      assert_equal "$370.20", price
      assert_equal "2016-02-28T06:01-08:00", departure_date
      assert_equal "2016-02-28T13:46-05:00", arrival_date
      assert_equal "UA", departure_airline
      assert_equal "EWR", arrival_city
      assert_equal "LAS", origin_city
    end
  end
end
