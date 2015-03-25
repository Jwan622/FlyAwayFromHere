require 'test_helper'

class TripInfosControllerTest < ActionController::TestCase
  include
  test "should get index" do
    get :index
    assert_response :success
  end
end
