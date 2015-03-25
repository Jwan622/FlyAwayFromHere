require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "an unauthenticated user can click signup on the root page and see
    the signup form" do
    skip
    visit root_path

    click_link "Signup"

    assert page.has_content?("Signup and Fly")
  end

  test "a user can signup and return back to root url" do
    skip
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

  test "when user signs up an activation mail gets sent and the user is
    redirected back to root with the appropriate message and the user is not yet
    signed in." do
    visit new_user_path
    assert_difference 'User.count', 1 do
      fill_in "user[username]", with: "Jwan622"
      fill_in "user[first_name]", with: "Jeffrey"
      fill_in "user[last_name]", with: "Wan"
      fill_in "user[city]", with: "New York City"
      fill_in "user[email]", with: "Jwan622@gmail.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      fill_in "user[state]", with: "New York"
      fill_in "user[country]", with: "USA"
      click_button "Finish Signup"
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = User.find_by(username: "Jwan622")
    refute user.activated?
    log_in(as: user)

    assert page.has_content?("Account not activated. Check your email for activation link.")
    assert page.has_button?("Login", count: 1)
  end

  test "valid signup information with account activation" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, user: { username:  "Jwan622",
                               first_name: "Jeffrey",
                               last_name: "Wan",
                               email: "Jwan622@yahoo.com",
                               password:              "password",
                               password_confirmation: "password",
                               city: "New York City",
                               state: "New York",
                               country: "United States"
                              }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    log_in_as(user)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token")
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?
    # Valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template :new
    assert is_logged_in?
  end
end
