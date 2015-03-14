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
    role:                  0,
    departure_airport:     "NYC"
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
  role:                  1,
  departure_airport:     "NYC"
  )

# categories-location
aruba = Category.create!(
  name: "Aruba",
  type: "Location",
  destination_airport: "AUA"
)

aruba.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-aruba.jpg")
)

barcelona = Category.create!(
  name: "barcelona",
  type: "Location",
  destination_airport: "BCN"
)

barcelona.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-barca.jpg")
)

iceland = Category.create!(
  name: "Reykjavik",
  type: "Location",
  destination_airport: "RKV"
)

iceland.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-iceland.jpg")
)

kyoto = Category.create!(
  name: "Kyoto",
  type: "Location",
  destination_airport: "KIX"
)

kyoto.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-kyoto.jpg")
)

new_york = Category.create!(
  name: "New York City",
  type: "Location",
  destination_airport: "JFK"
)

new_york.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-nyc.png")
)


los_angeles = Category.create!(
  name: "Los Angeles",
  type: "Location",
  destination_airport: "LAX"
)

los_angeles.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-LA.jpg")
)

london = Category.create!(
  name: "London",
  type: "Location",
  destination_airport: "LCY"
)

london.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-london.jpg")
)


shanghai = Category.create!(
  name: "Shanghai",
  type: "Location",
  destination_airport: "PVG"
)

shanghai.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-shanghai.jpg")
)


sydney = Category.create!(
  name: "Sydney",
  type: "Location",
  destination_airport: "SYD"
)

sydney.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-sydney.jpeg")
)

# trips
Trip.create!(
  title: "Iceland",
  price: 50000,
  short_description: 'The Land of Ice, Fire, and Mountains',
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "Delta",
  departure_date: Date.new(2010,2,3),
  return_date: Date.new(2010,2,3),
  downvotes: 10,
  arrival_city: "Reykjavik",
  upvotes: 15,
  categories: [iceland],
  photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/ice.jpg"))])

hawaii = Trip.create!(
  title: "barcelona",
  price: 70000,
  short_description: "Park Guell, Gaudi everything, and the land of tapas.",
  full_description: "Park Guell, Gaudi everything, and the land of tapas." +
                    "Park Guell, Gaudi everything, and the land of tapas.",
  airline: "Delta",
  departure_date: Date.new(2010,2,3),
  return_date: Date.new(2010,2,3),
  downvotes: 10,
  arrival_city: "barcelona",
  upvotes: 15,
  categories: [barcelona],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/trip-hawaii.jpg"))])

new_york = Trip.create!(
  title: "New York",
  price: 19999,
  short_description: "New York City Trip with new york category",
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "AA",
  departure_date: Date.new(2011,4,3),
  return_date: Date.new(2010,2,3),
  arrival_city: "New York",
  downvotes: 10,
  upvotes: 1,
  categories: [new_york],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-nyc.png"))])

london = Trip.create!(
  title: "London",
  price: 50000,
  short_description: "London Trip with London category",
  full_description: "Why do people use Lorem Ipsum and not just blah blah" +
                    "Why do people use Lorem Ipsum and not just blah blah.",
  airline: "AA",
  departure_date: Date.new(2015,4,3),
  return_date: Date.new(2015,7,3),
  arrival_city: "London",
  downvotes: 10,
  upvotes: 1,
  categories: [london],
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
  arrival_city: "Kyoto",
  downvotes: 10,
  upvotes: 1,
  categories: [kyoto],
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-kyoto.jpg"))])

10.times do |number|
  Trip.create!(
  title: "Los Angeles#{number+1}",
  price: 11000 + number,
  short_description: "This is a trip to be among actors/bartenders.",
  airline: "AA",
  departure_date: Date.new(2015,2,2),
  return_date: Date.new(2015,3,number+1),
  full_description: "This is a trip to be among actors/bartenders." +
                    "This is a trip to be among actors/bartenders." +
                    "This is a trip to be among actors/bartenders.",
  arrival_city: "Los Angeles",
  upvotes: 120 + number - 5,
  downvotes: 120 + number - 2,
  categories: [los_angeles],
  photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/cat-festivals.jpg"))])
end

10.times do |number|
  Trip.create!(
  title: "Aruba#{number+1}",
  price: 55678,
  short_description: "These are trips in the Aruba Category",
  airline: "AA",
  departure_date: Date.new(2015,2,2),
  return_date: Date.new(2015,3,number+1),
  full_description: "These are trips in the Aruba Category" + "These are
                    trips in the Aruba Category Lorem Ipsum",
  arrival_city: "Orenjestad",
  upvotes: 120 + number - 5,
  downvotes: 120 + number - 2,
  categories: [aruba],
  photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/location-aruba.jpg"))])
end

10.times do |number|
  Trip.create!(
  title: "Shanghai#{number+1}",
  price: 55678,
  short_description: "These are trips in the Shanghai Category",
  airline: "AA",
  departure_date: Date.new(2015,2,2),
  return_date: Date.new(2015,3,number+1),
  full_description: "These are trips in the Shanghai and party Category" +
                    "These are trips in the Shanghai Category Lorem Ipsum",
  arrival_city: "Shanghai",
  upvotes: 120 + number - 5,
  downvotes: 120 + number - 2,
  categories: [shanghai],
  photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/location-shanghai.jpg"))])
end

10.times do |number|
  Trip.create!(
  title: "Sydney And the Land Down Under#{number+1}",
  price: 12000 + number,
  short_description: "These are trips in the Great Cities and Party Category",
  airline: "AA",
  departure_date: Date.new(2015,2,2),
  return_date: Date.new(2015,3,number+1),
  full_description: "These are trips in the Great Cities and party Category" +
                    "These are trips in the Great Cities Category Lorem Ipsum",
  arrival_city: "Sydney",
  upvotes: 120 + number - 5,
  downvotes: 120 + number - 2,
  categories: [sydney],
  photos: [Photo.create(avatar: File.new("#{Rails.root}/app/assets/images/location-sydney.jpeg"))])
end
