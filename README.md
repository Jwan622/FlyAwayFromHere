# FlyAwayFromHere

Fly Away From Here is an app that helps users find cheap domestic and international flights. A user can specify a destination city, an origin city, a max price, and travel dates and the application will help users find cheap flights while adhering to the user's preferences. However, the big use case for the app is the "big red button" which generates flight ideas and ticket prices that are under $500 from the user's origin city. It takes away the pain of trip planning.

### Getting Started
To get the app running locally or run the test suite:

```
git clone git@github.com:Jwan622/FlyAwayFromHere.git
cd FlyAwayFromHere
bundle install

rails s # to run the server
```
To run the tests:

```
rake test
```

### Using the app
There are 3 main ways to use the application.
* You can use the planner which is on the home page. It has 5 select boxes for which a user can state their preferences.
* The second way is to simply select a location category which is located undernear the praise bar on the home page. These category buttons will search for trips in the future at the desired location.  
* Third, you can hit the big red button which will search all of the locations in the app for trips underneath a price threshold of $500 for dates in the future.  

### The code:
Please feel free to inspect the code quality. The main functionality is within:  
* app/models/real_trip.rb  
* app/controllers/real_trips_controller.rb  
* app/services/find_trip.rb  
* app/services/qpx_service.rb  

### This personal project incorporates the following functionality:
* Consuming the QPX flight*data API  
* Twitter Oauth  
* Activation Account mailer in development and production using Rails' Action Mailer.
* Friendly forwarding
* Fragment caching  
* Presenter classes for cleaning up the Rails views of Activerecord logic.  
* Non-databased backed models/POROs for converting API data into Ruby objects.  
* PORO's for activerecord ducktyping. Since I was using Non-databased backed models, I needed to create a PORO to simulate ActiveRecord methods to create/modify the non-databased backed models and make them available for use in the controller/views.  
* Twitter Bootstrap  

### If you want to create additional functionality:
* You can only search for trips that are categories in the database. So if you want to fly to Boston, you need to create a Category in the seed file or create a Category via the web app as admin (not implemented yet). Currently, the seed file is the only way to add new location categories to fly to. You would then need to add the airport/cities to the hashes in the AirportAndCityLookuphelper module.  
* There are helpers in the support folder that allow you to reach real_trips_index page and the real_trip_info pages while writing new tests. Simply call the method in the associated folders and the setup will be complete and those pages will be reachable.

### Things I learned from this project:

1. The Presenter allows objects to be in display format. Think of them as adding convenience methods. They allow view to stay slim and not leave logic in view.  
2. FindTrip, a service object, calls the qpx_service object and then uses the data returned from the api to create real_trip objects.  
3. The controller's job is to transform data that it receives from the views and give it to a different class like the FindTrip class. The FindTrip class does not need to know about how the request parameters come through. It just needs to know how to find trips using the data that it's passed and it uses the QPXService to do so. The goal is to decouple and keep objects as dumb as possible. This way, refactoring like I had to midway through the project is easier in the future.
4. In FindTrip, the find_all method was originally written like this:  
```
 if qpx_search["trips"]["tripOption"]
   qpx_search["trips"]["tripOption"].map do...
```
but that was making two calls to the api which was inefficient.  You refactored it to:

```
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

You stored the first method call results in a variable and then iterate over it.

5. Activation mailers are harder to build than previously thought. The email needs to have a link that hits the edit action of the AccountActivationsController which should turn the user's activated state to true. That link needs to have the activation token and the user's email (the email is to lookup the user). When a user logs in, that's when you actually check the user's activated state, which only is true if the user clicks the email. Alternatively, a user can just login via oauth and now the user is logged in as current_user and can use the site.  
6. The decorator pattern is a design pattern that allows behavior to be added to an individual object without affecting the behavior of other objects from the same class.

This is useful because we can add additional behavior to an instantiated model, like @user, before passing it on to the template from the controller. However, in other contexts, the User model, doesn't have the added behavior that's the result of the decoration. This helps to separate concerns, while still adding necessary functionality to an object when appropriate.

I use the decorator in the TripsPresenter class.

### Breakdown of files:
Classes:
* The RealTrip class takes in the real api data and wraps them in a Ruby object.  
* Inside this RealTrip Class, we take the airport code that comes back from the api ("JFK"), converts the code to an airport slug ("new-york-city"), and we do a lookup for the category name based on the airport slug. We then use the Category name ("New York"). For instance, we go from "LON" to "london" to "London".
* I chose to separate out the service object (QPX Service) and the PORO (Find_trip). The Find trip calls the service object and iterates over the array of JSON data converting it into RealTrip objects.
