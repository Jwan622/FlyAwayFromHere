require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def test_a_user_cannot_see_trips_while_not_logged_in
    create(:category)

    visit root_path
    click_link "Delhi"

    assert page.has_content?("You must login first before flying.")
  end

  def test_a_user_can_use_login_fields_to_log_in
    user = create(:user)

    visit root_path
    log_in(user)

    assert page.has_content?("Welcome back to the skies flyer1")
  end

  def test_a_user_can_see_trips_while_logged_in
    create(:category)
    user = create(:user)
    QPXService.any_instance.stubs(:search).returns(JSON.parse(qpx_data))

    visit root_path

    assert_response :success
    assert page.has_content?("Here are your search results!")
  end
end
