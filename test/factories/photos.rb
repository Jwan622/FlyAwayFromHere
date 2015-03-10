FactoryGirl.define do
  factory :photo do
    avatar File.new("#{Rails.root}/app/assets/images/default.jpg")
  end

end
