#### Walking through some key parts of the code:
1. If you click on a category on the first page, the link_to's url is a custom path helper that I created in the helpers/new_planner_helper.rb file.

```rails
def real_trips_path_by(category)
  if current_user
    real_trips_path(plan: { destination: category.slug, origin: current_user.departure_city_slug, departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD9999"} )
  else
    real_trips_path(plan: { destination: category.slug, origin: "unknown", departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD9999"} )
  end
end
```

The reason why I needed this because I needed to grab things on the page and pass them to the real_trips_controller that weren't just intrinsic to the category like the current_user's departure city. **I wonder if I needed to pass in the departure_dates and return_dates and max price or if they could have been handled later on in the code perhaps in the service object. I need to look into this.**

2. Let's look at our real_trips_controller index action:

```ruby
def index
  if planner_params_incomplete?
    redirect_to new_planner_path, flash: { error: "Please fill out your flight preferences fully."}
  elsif arriving_and_departing_to_same_destination?
    redirect_to new_planner_path, flash: { error: "We love flying too, but you can't fly to and depart from the same city..."}
  elsif bargain_hunting?
    trips = FindTrip.new(trip_search_params).bargains.flatten
    @trips = TripsPresenter.new(trips).ordered_by_price
  else
    trips = FindTrip.new(trip_search_params).find_all
    @trips = TripsPresenter.new(trips).ordered_by_price
  end
end
```

- So if planner_params_incomplete? is true meaning is destination or origin or departure date or max price is blank, then we redirect back to the planners/new.html.erb page.
- arriving_and_departing_to_same_destination is self explanatory. That's off origin and destination are == .
- If we go into bargain_hunting? which is if the user clicks the big red button, then we finally get into the FindTrip model.

Some notes before proceeding. Let's take a look at the NewPlannerHelper:

```ruby
module NewPlannerHelper
  def real_trips_path_by(category)
    if current_user
      real_trips_path(plan: { destination: category.slug, origin: current_user.departure_city_slug, departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD9999"} )
    else
      real_trips_path(plan: { destination: category.slug, origin: "unknown", departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD9999"} )
    end
  end

  def real_trips_for_bargain_path
    if current_user
      real_trips_path(plan: { destination: "bargainer", origin: current_user.departure_city_slug, departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD500"} )
    else
      real_trips_path(plan: { destination: Category.all, origin: "unknown", departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD9999"} )
    end
  end
```

The check that I implemented is that if there is no current_user, the query parameter that we send has origin: "unknown" which will cause us to hit the planner_params_incomplete? conditional in the index action.

3. Let's look at FindTrip and what happens when we hit the big red button.

So when we hit here:

```ruby
elsif bargain_hunting?
  trips = FindTrip.new(trip_search_params).bargains.flatten
  @trips = TripsPresenter.new(trips).ordered_by_price
```

trip_search_params will be the symbolized keys and will look like this:

```
{:destination=>"bargainer", :origin=>"new-york-city", :departure_date=>"2016-01-29 19:01:08 UTC", :return_date=>"2016-02-13 19:01:08 UTC", :max_price=>"USD500"}
```

The most important fields are the destination and max_price

- In FindTrip's initilaize method, we have required keyword arguments:

> If a required keyword argument is missing, Ruby will raise a useful ArgumentError that tells us which required argument we must include. With first-class keyword arguments in the language, we don’t have to write the boilerplate code to extract hash options. Unnecessary boilerplate code increases the opportunity for typos and bugs. By using keyword arguments, we know what the arguments mean without looking up the implementation of the called method which is an advantage over just plain old positional arguments. Keyword arguments allow us to switch the order of the arguments, without affecting the behavior of the method:

Here is that code:
```rails
def initialize(destination:, origin:, departure_date:, return_date:, max_price: "5000")
  @destination = destination
  @cleaned_destination = ""
  @origin = origin
  @cleaned_origin = ""
  @departure_date = departure_date
  @cleaned_departure_date = ""
  @return_date = return_date
  @cleaned_return_date = ""
  @max_price = max_price
  @qpx_service = QPXService.new
end
```

And we then call the bargains method:

```
def bargains
  all_bargain_trips = Category.location_categories.map do |category|
    @destination = category.slug
    find_all
  end
  all_bargain_trips
end
```

The .slug takes the lower-cased and hyphenated names of the cities. This method takes the Category names, sluggifies them so we can then use the slugs as destinations which can then be used in the airport_and_city_lookup_helper to convert the destinations into its proper format for use in the API.

The bargains method calls the find_all method which is below:

```rails
def find_all
  if qpx_data = qpx_search["trips"]["tripOption"]
    qpx_data.map do |trip_data|
      RealTrip.new(trip_data)
    end
  else
    []
  end
end
```
- qpx_data is going to be an array of trips that satisfy the search.
- The find_all method in FindTrip is going to do a QPX search with the destination, origin, departure date, return date, and max price in mind with cleaned data. It will return the array of trips in qpx_data and then create RealTrip objects out of them. So find_all returns an array of RealTrip objects.

#### Some other points to note:
- I overrode the to_param method on a RealTrip (a PORO with no id) so that I can get the trip info.

```rails
def show
    22:   require 'pry' ; binding.pry
 => 23:   @trip_info = TripInfo.find(params[:id])
    24:   @real_trip_info = RealTripInfo.new(real_trip_params)
25: end
```

params[:id] is going to be an arrival_airport like "LAS"

TripInfo looks something like this:
#<TripInfo id: 1, title: "Aruba... the Dutch Paradise of Conch and Beaches.", city: "Aruba", short_description: "At the island’s extreme ends are rugged, windswept...", long_description: "Americans from the east coast fleeing winter make ...", airport: "AUA", created_at: "2016-01-09 17:17:51", updated_at: "2016-01-09 17:17:51">

You see the short_description on the Explore page and you see the title when you click a category, click the details page.

Why do I find the TripInfo by airport name like "LAS" instead of Las Vegas?
So the TripInfo has an airport column which really is more of a description of the location. It really should be called "location". It's going to be something like "LAS" or "NYC". The thing is that if someone flies into las vegas or wants to go nearby, the trip info that's relevant is always "LAS". So I have the lib/airport_and_city_lookup_helper convert all those nearby cities into the same TripInfo by doing a lookup using the airport from QPX. This way I don't need to keep growing the TripInfo table for every city in the world. I can just convert the nearby airports all into the same TripInfo. So regardless of whether you're flying into EWR or JFK, the TripInfo that's important is still NYC.


- I should/can decorate this:
This is inside the views/real_trips/index.html.erb page

```rails
<% if !@trips.present? %>
  <p class="no-trip"> There are currently no available trips to this destination. Please make other plans.</p>
<% end %>
```


- The public/system folder was becoming bloated everytime I ran the test suite. The problem was paperclip. These files were a problem:


```rails
class Photo < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :trip_info

  has_attached_file :avatar,
                    :styles => { :medium => "310x300#",
                                 :thumb => "100x100#",
                                 :city => "260x250#",
                                 :large => "500x300#"
                                },
                    :default_url => "/images/:style/logo3.png",

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
```

Basically the default path (the place where the files are uploaded) was a new number every time so it was making a new folder number everytime we uploaded a photo in the test suite. So we needed to change the photo model to this:

Remember the default path in paperclip is this:
```
The files that are assigned as attachments are, by default, placed in the directory specified by the :path option to has_attached_file. By default, this location is :rails_root/public/system/:class/:attachment/:id_partition/:style/:filename
```

the :id_partition line was causing problems and was creating a new 3-digit number folder for every file that was uploaded.

```rails
class Photo < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :trip_info

  has_attached_file :avatar,
                    :styles => { :medium => "310x300#",
                                 :thumb => "100x100#",
                                 :city => "260x250#",
                                 :large => "500x300#"
                                },
                    :default_url => "/images/:style/logo3.png",
                    :path => "public/assets/pdfs/:basename.:extension",
                    :url => "public/assets/pdfs/:basename.:extension"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
```

Our factories (:category) and (:photo) both create a new photo. The (:category) factory has a callback to create a new photo.

```rails
FactoryGirl.define do
  factory :photo do
    avatar File.new("#{Rails.root}/app/assets/images/default.jpg")
  end
end
```

This made sure that the file that was uploaded in the test suite wouldn't create a new numbered folder everytime. This fixed our problem.

Also this problem was fixed... after a while my images weren't showing and I wasn't sure why. But this fixed my problem:

```rails
has_attached_file :avatar,
                  :styles => { :medium => "310x300#",
                               :thumb => "100x100#",
                               :city => "260x250#",
                               :large => "500x300#"
                              },
                  :url => "/images/:class/:style/:basename.:extension",
                  :default_url => "/images/:style/logo3.png"
```
The first slash is important in the url. I don't know why.
I only changed the url and apparently it knows that it's inside the public folder.

This is the default path:
```
2.1.3 :006 > Paperclip::Attachment.default_options
 => {:convert_options=>{}, :default_style=>:original, :default_url=>"/:attachment/:style/missing.png", :escape_url=>true, :restricted_characters=>/[&$+,\/:;=?@<>\[\]\{\}\|\\\^~%# ]/, :filename_cleaner=>nil, :hash_data=>":class/:attachment/:id/:style/:updated_at", :hash_digest=>"SHA1", :interpolator=>Paperclip::Interpolations, :only_process=>[], :path=>":rails_root/public:url",
```
