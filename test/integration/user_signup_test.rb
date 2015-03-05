require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "an unauthenticated user can click signup on the root page and see
    the signup form" do
    visit root_path

    click_link "Signup"

    assert page.has_content?("Signup and Fly")
  end

  test "a user can signup and return back to root url" do
    visit new_user_path

    fill_in "user[username]", with: "flyers1"
    fill_in "user[first_name]", with: "user"
    fill_in "user[last_name]", with: "name"
    fill_in "user[email]", with: "username@gmail.com"
    fill_in "user[street]", with: "street"
    fill_in "user[city]", with: "city"
    fill_in "user[state]", with: "state"
    fill_in "user[country]", with: "country"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Finish Signup"

    refute flash.empty?
    assert page.has_content?("Signup Successful")
  end

  test "a user can attach a photo during signup and see it in his profile" do

  end
end
