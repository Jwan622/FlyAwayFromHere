FactoryGirl.define do
  factory :trip do
    sequence(:title) { |n| "Iceland Escape#{n}" }
    price 150000
    short_description "Escape to Iceland"
    upvotes 50
    downvotes 30
    airline "AA"
    departure_date Date.new(2015,2,1)
    return_date Date.new(2015,4,4)
    full_description "Iceland Trip in Ice and Snow Trek Category"

    before(:create) do |trip|
      trip.categories << create(:category)
    end

    before(:create) do |trip|
      trip.photos << create(:photo)
    end
  end
end
