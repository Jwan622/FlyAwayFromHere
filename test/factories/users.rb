FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Flyer#{n}" }
    first_name "Jeffrey"
    last_name "Wan"
    street "E13th St Apt 3A"
    password "password"
    city "New York"
    state "NY"
    country "USA"
    role 0
    email "Jwan622@yahoo.com"
    departure_airport "JFK"
  end
end
