require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest
  test "A user can succesfully edit his profile" do
    user = create(:user)

    get edit_user_path(user)
    assert_template "users/edit"
    username = "Jwan622"
    first_name = "Jeffrey"
    last_name = "Jeffrey"
    email = "jwan622@yahoo.com"
    city = "London"
    state = "England"
    street = "31 Hillwood Court"
    patch user_path(user), { user: { username: username,
                                     first_name: first_name,
                                     last_name: last_name,
                                     email: email,
                                     city: city,
                                     state: state,
                                     street: street,
                                     password: "Ilikematzoh",
                                     password_confirmation: "Ilikematzoh"
                                    }
                           }
    user.reload

    assert_not flash.empty?
    assert_equal user.username, username
    assert_equal user.email, email
    assert_equal user.city, city
  end

  test "A user cannot edit his profile with incomplete information" do
    user = create(:user)
    get edit_user_path(user)
    assert_template "users/edit"
    patch user_path(user), user: { username: "",
                                   email: "foo@invalid",
                                   password: "foo",
                                   password_confirmation: "bar" }
    refute flash.empty?
    assert_template "users/edit"
  end
end
