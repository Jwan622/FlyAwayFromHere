FactoryGirl.define do
  factory :trip do
    title "Iceland Escape"
    price 150000
    description "Escape to Iceland"
    rating 5
    category "Sightseeing"
    airline "AA"
    flight_date Date.new(2015,2,1)
  end

end
