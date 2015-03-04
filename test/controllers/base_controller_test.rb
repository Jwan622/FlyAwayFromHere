require 'test_helper'

class BaseControllerTest < ActionController::TestCase
  test "should get dashboard" do
    skip
    get :dashboard
    assert_response :success
  end

end
