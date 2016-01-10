# Things I learned from this project:

1) The Presenter allows objects to be in display format. Think of them as adding convenience methods. They allow view to stay slim and not leave logic in view.  

2) FindTrip, a service object, calls the qpx_service object and then uses the real api data to create real_trip objects.  
3) The controller's job is to transform data from the views and give it to different objects. The FindTrip object does not need to know about how the request parameters come through. It just needs to know how to search terms. The goal is to decouple and keep objects as dumb as possible. This way, refactoring like I had to midway through the project is easier in the future.
4) For the love of god, look at the api first next time before building a rails app that uses an api.
5) In FindTrip, the find_all method was originally written like this:  
```
 if qpx_search["trips"]["tripOption"]
   qpx_search["trips"]["tripOption"].map do...
```
but that was making two calls to the api which was inefficient.  

6) activaation mailers are harder to build than previously though. The email needs to have a link that hits the edit action of the AccountActivationsController which should turn the user's activated state to true. That link needs to have the activation token and the user's email (the email is to lookup the user). When a user logs in, that's when you actually check the user's activated state, which only is true if the user clicks the email. Alternatively, a user can just login via oauth and now the user is logged in as current_user and can use the site.  


### Breakdown of files:
Classes:
* The Real Trip class takes in the real api data and wraps them in a Ruby object.  
* Inside this Real Trip Class, we take the airport code that comes back from the api,  
  converts the code to an airport slug, and we do a lookup for the category based on the airport slug.  
  We then use the Category name. For instance, we go from "LON" to "london" to "London".

* I chose to separate out the service object (QPX Service) and the PORO (Find_trip). The Find trip calls the service object
  and iterates over the service object

### Refactor possibilities:
* I was thinking that I do not like how I setup Category in the database. I think in later iterations, I should have a  
  separate table for airport codes. A Category should have many airport codes so an admin can simply add a Category, give  
  category a name like "St. Petersberg" and give the appropriate airport codes which there will be several of (local,  
  international airports, etc.)

* In find_trip.rb, clean the arguments in the initialize method. I think this might actually be easier to read
  and prevents me from changing the internals of the object during the code.

* Naming of the POROs.




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

The .slug takes the lower-cased and hyphenated names of the cities.

So the qpx_data is going to be an array of trips that satisfy the search.




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
