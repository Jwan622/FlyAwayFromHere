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

# categories-quality
super_cheap = Category.create(name: "Super Cheap", type: "Quality")
valuable = Category.create(name: "Valuable", type: "Quality")

#categories-proximity
international = Category.create(name: "International", type: "Proximity")
domestic = Category.create(name: "Domestic", type: "Proximity")

# categories-activity
party = Category.create!(
  name: "Partaaaying",
  type: "Activity")

party.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-international.jpg")
)

beaches = Category.create!(
  name: "Beaches and Sunshine",
  type: "Activity")

beaches.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-beaches.jpg")
)

great_cities = Category.create!(
  name: "Seeing Great Cities",
  type: "Activity")

great_cities.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-cities.jpg")
)

festivals = Category.create!(
  name: "Festivals",
  type: "Activity")

festivals.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-festivals.jpg")
)

hiking = Category.create!(
  name: "Hiking",
  type: "Activity"
)

hiking.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-parks-yosemite.jpg")
)

eating = Category.create!(
  name: "Food Trip!",
  type: "Activity"
)

eating.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/cat-food.jpg")
)

ice = Category.create!(
  name: "Ice and Snow Trek",
  type: "Activity"
)

ice.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/ice.jpg")
)

# categories-location
new_york = Category.create!(
  name: "New York City",
  type: "Location"
)

new_york.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-nyc.png")
)

santa_monica = Category.create!(
  name: "Santa Monica",
  type: "Location"
)

santa_monica.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-santa.jpg")
)

london = Category.create!(
  name: "London",
  type: "Location"
)

london.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-london.jpg")
)

kyoto = Category.create!(
  name: "Kyoto",
  type: "Location"
)

kyoto.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-kyoto.jpg")
)

barcalona = Category.create!(
  name: "Barcalona",
  type: "Location"
)

barcalona.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-barca.jpg")
)

shanghai = Category.create!(
  name: "Shanghai",
  type: "Location"
)

shanghai.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-shanghai.jpg")
)

aruba = Category.create!(
  name: "Aruba",
  type: "Location"
)

aruba.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-aruba.jpg")
)

sydney = Category.create!(
  name: "Sydney",
  type: "Location"
)

sydney.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-sydney.jpeg")
)

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
  downvotes: 10,
  departure_city: "New York",
  arrival_city: "Reykjavik",
  upvotes: 15,
  categories: [ice, hiking, valuable, international],
  photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/ice.jpg"))])

hawaii = Trip.create!(
  title: "Hawaii",
  price: 70000,
  short_description: 'Island Nation of Coconuts',
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "Delta",
  departure_date: Date.new(2010,2,3),
  return_date: Date.new(2010,2,3),
  downvotes: 10,
  departure_city: "New York",
  arrival_city: "Honolulu",
  upvotes: 15,
  categories: [beaches, party, valuable, domestic],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/trip-hawaii.jpg"))])

greece = Trip.create!(
  title: "Greece",
  price: 90000,
  short_description: 'The birthplace of democracy and rioting',
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "Delta",
  departure_date: Date.new(2010,2,3),
  return_date: Date.new(2010,2,3),
  downvotes: 10,
  departure_city: "New York",
  arrival_city: "Athens",
  upvotes: 15,
  categories: [beaches, party, valuable, international],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/trip-hawaii.jpg"))])

maine = Trip.create!(
  title: "Maine",
  price: 40000,
  short_description: 'Want Lobsters?',
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "Delta",
  departure_date: Date.new(2010,2,3),
  return_date: Date.new(2010,2,3),
  departure_city: "Boston",
  arrival_city: "Portland",
  downvotes: 10,
  upvotes: 1000,
  categories: [eating, hiking, domestic, valuable],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/trip-hawaii.jpg"))])

costa_rica = Trip.create!(
  title: "Costa Rica",
  price: 30000,
  short_description: "Checkout the rain forests",
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "AA",
  departure_date: Date.new(2011,4,3),
  return_date: Date.new(2010,2,3),
  downvotes: 10,
  departure_city: "New York",
  arrival_city: "San Jose",
  upvotes: 1,
  categories: [beaches, hiking, valuable, international],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/trip-hawaii.jpg"))])

new_york = Trip.create!(
  title: "New York",
  price: 20000,
  short_description: "New York City Trip with new york category",
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "AA",
  departure_date: Date.new(2011,4,3),
  return_date: Date.new(2010,2,3),
  departure_city: "Los Angeles",
  arrival_city: "New York",
  downvotes: 10,
  upvotes: 1,
  categories: [new_york, great_cities, super_cheap, domestic],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-nyc.png"))])

santa_monica = Trip.create!(
  title: "Santa Monica",
  price: 10000,
  short_description: "Santa Monica Trip with Santa Monica category",
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "AA",
  departure_date: Date.new(2011,4,3),
  return_date: Date.new(2010,2,3),
  departure_city: "San Francisco",
  arrival_city: "Los Angeles",
  downvotes: 10,
  upvotes: 1,
  categories: [santa_monica, domestic, super_cheap, beaches],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-santa.jpg"))])

london = Trip.create!(
  title: "London",
  price: 50000,
  short_description: "London Trip with London category",
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "AA",
  departure_date: Date.new(2015,4,3),
  return_date: Date.new(2015,7,3),
  departure_city: "New York",
  arrival_city: "London",
  downvotes: 10,
  upvotes: 1,
  categories: [london, great_cities, international, valuable],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-london.jpg"))])

kyoto = Trip.create!(
  title: "Kyoto",
  price: 50000,
  short_description: "Kyoto Trip with Kyoto category",
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "AA",
  departure_date: Date.new(2015,4,3),
  return_date: Date.new(2015,8,3),
  departure_city: "New York",
  arrival_city: "Kyoto",
  downvotes: 10,
  upvotes: 1,
  categories: [kyoto, great_cities, valuable, international],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-kyoto.jpg"))])

10.times do |number|
  Trip.create!(
  title: "Octoberfest#{number+1}",
  price: 11000 + number,
  short_description: "These are trips in the Ice and Snow, Festivals, and super_cheap Categories",
  airline: "AA",
  departure_date: Date.new(2015,2,2),
  return_date: Date.new(2015,3,number+1),
  full_description: "These are trips in the Ice, festivals, super_cheap Category" +
                    "These are trips in the Ice and Snow Category Lorem Ipsum, this is" +
                    "nonsense. I hate Lorem Ipsum",
  departure_city: "Las Vegas",
  arrival_city: "Munich",
  upvotes: 120 + number - 5,
  downvotes: 120 + number - 2,
  categories: [ice, festivals, super_cheap, international],
  photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/cat-festivals.jpg"))])
end

10.times do |number|
  Trip.create!(
  title: "Aruba#{number+1}",
  price: 55678,
  short_description: "These are trips in the Beaches, Quality, Party Category",
  airline: "AA",
  departure_date: Date.new(2015,2,2),
  return_date: Date.new(2015,3,number+1),
  full_description: "These are trips in the Beaches Category" + "These are
                    trips in the Beaches Category Lorem Ipsum",
  departure_city: "New York",
  arrival_city: "Orenjestad",
  upvotes: 120 + number - 5,
  downvotes: 120 + number - 2,
  categories: [beaches, valuable, party, international],
  photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/location-aruba.jpg"))])
end

10.times do |number|
  Trip.create!(
  title: "Shanghai#{number+1}",
  price: 55678,
  short_description: "These are trips in the Great Cities and Party Category",
  airline: "AA",
  departure_date: Date.new(2015,2,2),
  return_date: Date.new(2015,3,number+1),
  full_description: "These are trips in the Great Cities and party Category" +
                    "These are trips in the Great Cities Category Lorem Ipsum",
  departure_city: "New York",
  arrival_city: "Shanghai",
  upvotes: 120 + number - 5,
  downvotes: 120 + number - 2,
  categories: [great_cities, party, international, valuable],
  photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/location-shanghai.jpg"))])
end

10.times do |number|
  Trip.create!(
  title: "Vegasss baby Vegas#{number+1}",
  price: 12000 + number,
  short_description: "These are trips in the Great Cities and Party Category",
  airline: "AA",
  departure_date: Date.new(2015,2,2),
  return_date: Date.new(2015,3,number+1),
  full_description: "These are trips in the Great Cities and party Category" +
                    "These are trips in the Great Cities Category Lorem Ipsum",
  departure_city: "New York",
  arrival_city: "Shanghai",
  upvotes: 120 + number - 5,
  downvotes: 120 + number - 2,
  categories: [great_cities, party, super_cheap, party, eating, domestic],
  photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/location-vegas.jpg"))])
end
