# users
15.times do |n|
  User.create!(
    username:              "flyer#{n + 1}",
    email:                 "flyer#{n + 1}@gmail.com",
    password:              "password",
    password_confirmation: "password",
    first_name:            Faker::Name.first_name,
    last_name:             Faker::Name.last_name,
    city:                  "New York City",
    state:                 "NY",
    street:                "E13th St",
    country:               Faker::Address.country,
    activated:             true,
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
  city:                  "New York City",
  state:                 "NY",
  street:                "E14th St",
  country:               Faker::Address.country,
  activated:             true,
  role:                  1
  )

# categories-location

# 1
aruba = Category.create!(
  name: "Aruba",
  type: "Location",
  destination_airport: "AUA"
)

aruba.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-aruba.jpg")
)

# 2
barcelona = Category.create!(
  name: "Barcelona",
  type: "Location",
  destination_airport: "BCN"
)

barcelona.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-barca.jpg")
)

# 3
delhi = Category.create!(
  name: "Delhi",
  type: "Location",
  destination_airport: "DEL"
)

delhi.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-delhi.jpg")
)

# 4
iceland = Category.create!(
  name: "Reykjavik",
  type: "Location",
  destination_airport: "RKV"
)

iceland.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-iceland.jpg")
)

# 5
kyoto = Category.create!(
  name: "Kyoto",
  type: "Location",
  destination_airport: "KIX"
)

kyoto.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-kyoto.jpg")
)

# 6
las_vegas = Category.create!(
  name: "Las Vegas",
  type: "Location",
  destination_airport: "LAS"
)

las_vegas.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-vegas.jpg")
)

# 7
new_york = Category.create!(
  name: "New York City",
  type: "Location",
  destination_airport: "NYC"
)

new_york.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-nyc.png")
)

# 8
london = Category.create!(
  name: "London",
  type: "Location",
  destination_airport: "LON"
)

london.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-london.jpg")
)

# 9
los_angeles = Category.create!(
  name: "Los Angeles",
  type: "Location",
  destination_airport: "LAX"
)

los_angeles.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-LA.jpg")
)

# 10
shanghai = Category.create!(
  name: "Shanghai",
  type: "Location",
  destination_airport: "PVG"
)

shanghai.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-shanghai.jpg")
)

# 11
sydney = Category.create!(
  name: "Sydney",
  type: "Location",
  destination_airport: "SYD"
)

sydney.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-sydney.jpeg")
)

# 12

munich = Category.create!(
  name: "Munich",
  type: "Location",
  destination_airport: "MUC"
)

munich.photos << Photo.create!(
  avatar: File.new("#{Rails.root}/app/assets/images/location-munich.jpg")
)

TripInfo.create!(
  title: "Aruba... the Dutch Paradise of Conch and Beaches.",
  city: "Aruba",
  short_description: "At the island’s extreme ends are rugged, windswept vistas and uncrowded beaches. Aruba offers so much to the paradise-seeker.",
  long_description: "Americans from the east coast fleeing winter make Aruba the most touristed island in the southern Caribbean.
And that’s not really surprising given that it has miles of the best beaches, plenty of package resorts and a compact and cute main town, Oranjestad, which is ideally suited for the two-hour strolls favored by day-tripping cruise-ship passengers. It’s all about sun, fun and spending money.",
  airport: "AUA",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-aruba.jpg"))]
)

TripInfo.create!(
  title: "Barcelona, Welcome to the Iberian Peninsula.",
  city: "Barcelona",
  short_description: "Tapas, beaches, Rioja wines, Gaudi architecture, and history are rich on this side of the Mediterrenean.",
  long_description: "The deep blue Mediterranean beckons. Sun-drenched beaches make a fine backdrop to a jog, bike ride or long leisurely stroll along the seaside – followed by a refreshing dip, of course. You can also enjoy the view from out on the water while kayaking, stand-up paddleboarding or taking it easy on a sunset cruise. Looming behind the city, the rolling forest-covered Collserola Hills provide a scenic setting for hiking, mountain biking or just admiring the view. Closer to the city centre, hilltop Montjuïc offers endless exploring amid botanic and sculpture gardens, an old castle and first-rate museums with panoramic views at every turn.",
  airport: "BCN",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-barca.jpg"))]
)

TripInfo.create!(
  title: "Delhi, the Land of Fire and Ice",
  city: "Delhi",
  short_description: "Mystery, magic, mayhem. Welcome to Delhi. The ruins of Mughal forts and medieval bazaars are scattered between the office blocks, shopping malls, and tangled expressways.",
  long_description: "India’s capital is littered with the relics of lost empires. A succession of armies stormed across the Indo-Gangetic plain and imprinted their identity onto the vanquished city, before vanishing into rubble and ruin like the conquerors who preceded them. Modern Delhi is a chaotic tapestry of medieval fortifications, Mughal mausoleums, dusty bazaars, and colonial-era town planning. Navigating Delhi's seven cities (or 12, if you include British-built New Delhi and the satellite cities of Noida, Faridabad, Ghaziabad and Gurgaon) is made infinitely easier by the metro. With a smart card, you can minimise the hassle, and maximise the time spent in the city's magnificent museums and monuments, its stellar restaurants and its eclectic emporiums.",
  airport: "DEL",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-delhi.jpg"))]
)

TripInfo.create!(
  title: "Iceland, the Land of Fire and Ice",
  city: "Reykjavik",
  short_description: "This is the land of Fire and Ice.",
  long_description: "An under-populated island marooned near the top of the globe, Iceland is, literally, a country in the making. It's a vast volcanic laboratory where mighty forces shape the earth: geysers gush, mudpots gloop, ice-covered volcanoes rumble and glaciers grind great pathways through the mountains. Its supercharged splendour seems designed to remind visitors of their utter insignificance in the greater scheme of things. And it works a treat: some crisp clean air, an eyeful of the cinematic landscapes, and everyone is transfixed.",
  airport: "KEF",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-iceland.jpg"))]
)

TripInfo.create!(
  title: "Kyoto, the Land of Fire and Ice",
  city: "Kyoto",
  short_description: "Kyoto is old Japan writ large: quiet temples, sublime gardens, colourful shrines, and geisha scurrying to secret liaisons.",
  long_description: "While the rest of Japan has adopted modernity with abandon, the old ways are hanging on in Kyoto. Take a morning stroll through the textile district of Nishijin and watch the old Kyoto ladies emerge from their machiya (traditional townhouses) to ladle water onto their stoops. Visit an old shōtengai (shopping street) and admire the ancient speciality shops: tofu sellers, fishmongers, pickle vendors and tea merchants. Then join the locals at a local sentō (public bath) to soak away the cares of the day.",
  airport: "KIX",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-kyoto.jpg"))]
)

TripInfo.create!(
  title: "London, the Land of bad teeth and food. But oh their accents...",
  city: "London",
  short_description: "One of the world’s most visited cities, London has something for everyone: from history to culture, art to architecture.",
  long_description: "London is immersed in history. Not so much that it’s intimidating, but there’s sufficient antiquity and historic splendour (Tower of London, Westminster Abbey, Hampton Court) to blow you away. London’s buildings are eye-catching milestones in the city’s unique and compelling biography. There’s more than enough funky innovation (the Shard, the Aquatics Centre, the Gherkin) to put a crackle in the air, but it never drowns out London’s well-preserved, centuries-old narrative. Architectural grandeur rises up all around you in the West End, ancient remains dot the City and charming pubs punctuate the Thames riverside. Take your pick.",
  airport: "LON",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-london.jpg"))]
)

TripInfo.create!(
  title: "Los Angeles, the City of Angels",
  city: "Los Angeles",
  short_description: "LA runs deeper than her blonde beaches, rolling hills and beemers-for-days would have you believe. She’s a myth. A beacon for countless small-town dreamers, rockers and risk-takers, an open-minded angel who encourages her people to live and let live without judgement or shame.",
  long_description: "LA is best defined by simple life-affirming moments: a cracked-ice, jazz-age cocktail on Beverly Blvd, a hike high into the Hollywood Hills sagebrush, a swirling pod of dolphins off Point Dume, a pink-washed sunset over a thundering Venice Beach drum circle, the perfect taco. And her night music. There is always night music.",
  airport: "LAX",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-LA.jpg"))]
)

TripInfo.create!(
  title: "Munich, the Home of Oktoberfest. What else do you need?",
  city: "Munich",
  short_description: "The natural habitat of well-heeled power dressers and lederhosen-clad thigh-slappers, Mediterranean-style street cafes and Mitteleuropa beer halls, high-brow art and high-tech industry, Germany’s second city is a flourishing success story that revels in its own contradictions.",
  long_description: "If you’re looking for Alpine clichés, they’re all here, but the Bavarian metropolis sure has many an unexpected card down its Dirndl. Statistics show Munich is enticing more visitors than ever, especially in summer and during Oktoberfest. Munich’s walkable centre retains a small-town air but holds some world-class sights, especially its art galleries and museums. Throw in a king’s ransom of royal Bavarian heritage, an entire suburb of Olympic legacy and a kitbag of dark tourism and you can see why it's such a favourite among those who seek out the past, but like to hit the town once they’re done.",
  airport: "MUC",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-munich.jpg"))]
)

TripInfo.create!(
  title: "New York. We are the center of it all.",
  city: "New York City",
  short_description: "The true New Yorker secretly believes that people living anywhere else have to be, in some sense, kidding.",
  long_description: "Although the city may present itself as rather straightforward – especially when one navigates the relentless stripes of perpendicular gridiron – New York is infinitely complex; it’s intricate parts twisting in tandem like the cogs of a clock. This feels particularly fitting in a place that has its own standards for telling time. Sand passes through the hourglass much faster here – change is constantly afoot, as locals hunt down the latest and greatest with alacrity only to shift gears the following week in search of the next big hit. So it really doesn’t matter when you visit – today, tomorrow, or in a year’s time – New York will always be ahead of the curve.",
  airport: "NYC",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-nyc.png"))]
)

TripInfo.create!(
  title: "Shanghai, the City on the Sea.",
  city: "Shanghai",
  short_description: "Shànghǎi: few world cities evoke so much history, excess, glamour, mystique and exotic promise in name alone",
  long_description: "Shànghǎi pulls a rabbit or two from its top hat. This is home to the world's second-tallest tower and a host of other neck-craning colossi. But it's not all sky-scraping razzmatazz. Beyond the crisply cool veneer of the modern city typified by Pǔdōng, you can lift the lid to a treasure chest of architectural styles. The city's period of greatest cosmopolitan excess – the 1920s and 1930s – left the city with pristine examples of art deco buildings, most of which survived the 20th-century vicissitudes assailing Shànghǎi. And there's more: from Jesuit cathedrals, Jewish synagogues and Buddhist temples to home-grown lòngtáng laneway and shíkùmén housing, Shànghǎi’s architectural heritage is like nowhere else.",
  airport: "PVG",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-shanghai.jpg"))]
)

TripInfo.create!(
  title: "Sydney, the Land Down Under",
  city: "Sydney",
  short_description: "Defined just as much by its rugged coast as its exquisite harbour, Sydney relies on its coastal setting to replenish its reserves of charm; venture too far away from the water and the charm suddenly evaporates. Jump on a ferry and Sydney's your oyster – the harbour prises the city's two halves far enough apart to reveal an abundance of pearls. On the coast, Australia ends abruptly in sheer walls of sandstone punctuated by arcs of golden sand.",
  long_description: "Brash is the word that inevitably gets bandied around when it comes to describing the Harbour City, and let's face it, Sydney is one hot mess! Compared to its Australian sister cities, Sydney is loud, uncompromising and in-your-face. Fireworks displays are more dazzling here, heels are higher, bodies more buffed, contact sports more brutal, starlets shinier, drag queens glitzier and chefs more adventurous. Australia’s best musos, foodies, actors, stockbrokers, models, writers and architects flock to the city to make their mark, and the effect is dazzling: a hyperenergetic, ambitious marketplace of the soul, where anything goes and everything usually does.",
  airport: "SYD",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-sydney.jpeg"))]
)

TripInfo.create!(
  title: "Vegas baby, Vegas.",
  city: "Las Vegas",
  short_description: "Sin City... Need we say more?",
  long_description: "Obviously what happens in Vegas stayed in Vegas and that's what makes it the ultimate escape. It's the only place you can spend the night partying in ancient Rome, wake up in Paris and brunch under the Eiffel Tower, watch an erupting volcano at sunset and get married in a pink Cadillac at midnight. Double down with the high rollers, browse couture or tacky souvenirs, sip a neon 3ft-high margarita or a frozen vodka martini set on a bar made of ice – it's all here for the taking. Time is irrelevant in Sin City and emptying your wallet never felt so good.",
  airport: "LAS",
  photos: [Photo.create!(avatar: File.new("#{Rails.root}/app/assets/images/location-vegas.jpg"))]
)
