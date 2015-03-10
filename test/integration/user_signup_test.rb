require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "an unauthenticated user can click signup on the root page and see
    the signup form" do
    visit root_path

    click_link "Signup"

    assert page.has_content?("Signup and Fly")
  end

  test "a user can signup and return back to root url" do
    get new_user_path

    post users_path, user: { username: "jwan6222",
                                first_name: "user",
                                last_name: "name",
                                email: "username@gmail.com",
                                street: "street",
                                city: "city",
                                state: "state",
                                country: "country",
                                password: "password",
                                password_confirmation: "password" }

    refute flash.empty?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", users_path, count: 0
  end
end
