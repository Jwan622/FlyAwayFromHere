require 'test_helper'

class TripsControllerTest < ActionController::TestCase

  def test_qpx_data_has_relevant_fields_to_create_real_trip_objects
    QPXService.any_instance.stubs(:search).returns(JSON.parse(QPXStubbedJSON.qpx_data.to_json))
    trip_data = QPXService.new.search
    price = trip_data["trips"]["tripOption"].first["saleTotal"].gsub("USD", "$")
    departure_date = trip_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["departureTime"]
    arrival_date = trip_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["arrivalTime"]
    departure_airline = trip_data["trips"]["tripOption"].first["slice"].first["segment"].first["flight"]["carrier"]
    arrival_city = trip_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["destination"]
    origin_city = trip_data["trips"]["tripOption"].first["slice"].first["segment"].first["leg"].first["origin"]


    assert_response :success
    assert_equal "$100", price
    assert_equal "2015-01-01", departure_date
    assert_equal "2015-01-02", arrival_date
    assert_equal "UA", departure_airline
    assert_equal "DEN", arrival_city
    assert_equal "NYC", origin_city
  end
end
