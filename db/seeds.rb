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
    role:                  0
    )
end
flyer = User.find_by(username: "flyer1")

# admin
User.create!(
  username:              "admin",
  email:                 "admin@gmail.com",
  password:              "password",
  password_confirmation: "password",
  first_name:            Faker::Name.first_name,
  last_name:             Faker::Name.last_name,
  city:                  "New York",
  state:                 "NY",
  street:                "E14th St",
  country:               Faker::Address.country,
  role:                  1
  )

# categories

parks = Category.create(name: "Parks")
beaches = Category.create(name: "Beaches")
sightseeing = Category.create(name: "Sightseeing")
festivals = Category.create(name: "Festivals")


# trips
iceland = Trip.create!(title: "Iceland", price: 80000, description: 'The Land of Ice, Fire, and Mountains', airline: "Delta", flight_date: Date.new(2010,2,3), ranking: 5 )
hawaii = Trip.create!(title: "Hawaii", price: 70000, description: 'Island Nation of Coconuts', airline: "Delta", flight_date: Date.new(2010,2,3), ranking: 3)
greece = Trip.create!(title: "Greece", price: 90000, description: 'The birthplace of democracy and rioting', airline: "Delta", flight_date: Date.new(2010,2,3), ranking: 3)
maine = Trip.create!(title: "Maine", price: 40000, description: 'Want Lobsters?', airline: "Delta", flight_date: Date.new(2010,2,3), ranking: 2)
