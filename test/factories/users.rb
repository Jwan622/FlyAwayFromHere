FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "flyer#{n}" }
    first_name "Jeffrey"
    last_name "Wan"
    street "E13th St Apt 3A"
    password "password"
    city "New york city"
    state "NY"
    country "USA"
    role 0
    sequence(:email) { |n| "Jwan622@yahoo.com#{n}" }
    departure_city_slug "new-york-city"
    activated false
  end
end
