# users

10.times do |n|
  User.create!(
    username:              "flyer#{n + 1}",
    email:                 "flyer#{n + 1}@gmail.com",
    password:              "password",
    password_confirmation: "password",
    first_name:            Faker::Name.first_name,
    last_name:             Faker::Name.last_name,
    city:                  "New York",
    state:                 "NY",
    street:                "E13th St",
    country:               Faker::Address.country,
    )
end
flyer = User.find_by(username: "flyer1")

# categories

cheapskate = Category.create(name: "Cheapskate")
value_hunter = Category.create(name: "Value Hunter")
