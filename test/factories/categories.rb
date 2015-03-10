FactoryGirl.define do
  factory :category do
    name "Ice and Snow Trek"
    type "Activity"

    before(:create) do |category|
      category.photos << create(:photo)
    end
  end
end
