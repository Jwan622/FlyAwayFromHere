require "test_helper"

class UserCityChangeTest < ActionDispatch::IntegrationTest
  test "a user can change their home city and is redirect to root" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    create(:category, name: "London")
    create(:category, name: "Barcelona")

    assert_equal "New york city", user.city

    visit root_path

    select("London", from: "user_city")
    click_button "Update City"
    user.reload

    assert_equal root_path, current_path
    assert_equal "London", user.city

    select("Barcelona", from: "user[city]")
    click_button "Update City"
    user.reload

    assert_equal "Barcelona", user.city
  end
end
