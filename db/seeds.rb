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

# categories-activity

parks = Category.create!(
  name: "Parks",
  type: "Activity")

parks.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-parks-yosemite.jpg")
)

beaches = Category.create!(
  name: "Beaches",
  type: "Activity")

beaches.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-beaches.jpg")
)

sightseeing = Category.create!(
  name: "Sightseeing",
  type: "Activity")

sightseeing.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-sightseeing.jpg")
)

festivals = Category.create!(
  name: "Festivals",
  type: "Activity")

festivals.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-festivals.jpg")
)

cities = Category.create!(
  name: "Cities",
  type: "Activity"
)

cities.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-cities.jpg")
)

ice = Category.create!(
  name: "Icy exploration",
  type: "Activity"
)

ice.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/ice.jpg")
)


# categories-quality
super_cheap = Category.create(name: "Super Cheap", type: "Quality")
valuable = Category.create(name: "Valuable", type: "Quality")

#categories-proximity
international = Category.create(name: "International", type: "Proximity")
domestic = Category.create(name: "Domestic", type: "Proximity")

# trips
iceland = Trip.create!(
  title: "Iceland",
  price: 80000,
  short_description: 'The Land of Ice, Fire, and Mountains',
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "Delta",
  departure_date: Date.new(2010,2,3),
  return_date: Date.new(2010,2,3),
  ranking: 5)

iceland.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/ice.jpg")
)

hawaii = Trip.create!(
  title: "Hawaii",
  price: 70000,
  short_description: 'Island Nation of Coconuts',
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "Delta",
  departure_date: Date.new(2010,2,3),
  return_date: Date.new(2010,2,3),
  ranking: 3)

hawaii.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/trip-hawaii.jpg")
)

greece = Trip.create!(
  title: "Greece",
  price: 90000,
  short_description: 'The birthplace of democracy and rioting',
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "Delta",
  departure_date: Date.new(2010,2,3),
  return_date: Date.new(2010,2,3),
  ranking: 3)

greece.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/trip-greece.jpg")
)

maine = Trip.create!(
  title: "Maine",
  price: 40000,
  short_description: 'Want Lobsters?',
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "Delta",
  departure_date: Date.new(2010,2,3),
  return_date: Date.new(2010,2,3),
  ranking: 2)

maine.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/trip-maine.jpg")
)

costa_rica = Trip.create!(
  title: "Costa Rica",
  price: 30000,
  short_description: "Checkout the rain forests",
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "AA",
  departure_date: Date.new(2011,4,3),
  return_date: Date.new(2010,2,3),
  ranking: 4)
