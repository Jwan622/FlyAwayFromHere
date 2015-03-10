FactoryGirl.define do
  factory :category do
    name "Ice and Snow Trek"
    type "Activity"

    before(:create) do |category|
      category.photos << create(:photo)
    end
  end

  factory :category_hiking do
    name "Hiking Trip"
    type "Activity"

    before(:create) do |category|
      category.photos << create(:photo)
    end
  end

  factory :category_beaches do
    name "Beaches Trip"
    type "Activity"

    before(:create) do |category|
      category.photos << create(:photo)
    end
  end
end
