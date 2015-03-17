require 'test_helper'

class UserTest < ActiveSupport::TestCase
  attr_reader :user

  test "user has attributes" do
    user = build(:user)

    assert user.valid?
  end

  test "user is not valid without username" do
    user = build(:user, username: nil)

    refute user.valid?
  end

  test "user cannot have duplicate username" do
    user = build(:user, username: "Jwan622")
    user1 = build(:user, username: "Jwan622")

    assert user.save
    refute user1.save
  end

  test "user is not valid without password" do
    user = build(:user, password: nil)

    refute user.valid?
  end

  test "user is not valid without a first name" do
    user = build(:user, first_name: nil)

    refute user.valid?
  end

  test "user is not valid with empty strings as first name" do
    user = build(:user, first_name: "    ")

    refute user.valid?
  end

  test "user is not valid with empty strings as last name" do
    user = build(:user, last_name: "    ")

    refute user.valid?
  end

  test "user is not valid without an email address" do
    user = build(:user, email: nil)

    refute user.valid?
  end

  test "an valid_email? checks if emails are in vaild format" do
    user = build(:user)
    user1 = build(:user, email: "here@here@you")
    user2 = build(:user, email: "here.here@you")

    assert user.valid?
    refute user1.valid?
    refute user2.valid?
  end

  test "if a user has an invalid email, cannot be saved" do
    user = build(:user)
    user1 = build(:user, email: "here@here@here")
    user2 = build(:user, email: "here.here@here")

    assert user.save
    refute user1.save
    refute user2.save
  end

  test "a full name is actually the combined first name and last name" do
    user = build(:user, first_name: "Jeffrey", last_name: "Wan")

    assert_equal "Jeffrey Wan", user.full_name
  end

  test "a user has a departure city slug that's just the parameterized
    version of the city" do
    user = create(:user, city: "New York City")
    user1 = create(:user, city: "Los Angeles")

    assert_equal "new-york-city", user.departure_city_slug
    assert_equal "los-angeles", user1.departure_city_slug
  end
end
