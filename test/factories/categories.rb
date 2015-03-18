FactoryGirl.define do
  factory :category do
    name "Delhi"
    type "Location"

    before(:create) do |category|
      category.photos << create(:photo)
    end
  end
end
