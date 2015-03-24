# FlyAwayFromHere

Fly Away From Here is an app that helps users find cheap domestic and international flights. A user can specify a destination city, an origin city, a max price, and travel dates and the application will help users find cheap flights while adhering to the user's preferences. However, the big use-case for the app is the "big red button" which generates flight ideas and ticket prices that are under $500 from the user's origin city. It takes away the pain of trip planning.

### Getting Started
-To get the app running locally or run the test suite:

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
- app/models/real_trip.rb  
- app/controllers/real_trips_controller.rb  
- app/services/find_trip.rb  
- app/services/qpx_service.rb  

### This personal project incorporates the following functionality:
-Consuming the QPX flight-data API  
-Twitter Oauth  
-Friendly forwarding  
-Presenter classes for cleaning up the Rails views of Activerecord logic.  
-Non-databased backed models/POROs for converting API data into Ruby objects.  
-PORO's for activerecord ducktyping. Since I was using Non-databased backed models, I needed to create a PORO to simulate ActiveRecord methods to create/modify the non-databased backed models and make them available for use in the controller/views.  
-jQuery/JavaScript filtering  
-Twitter Bootstrap  

### If you want to create additional functionality:
-You can only search for trips that are categories in the database. So if you want to fly to Boston, you need to create a Category in the
 seed file or create a Category via the web app as admin (not implemented yet). Currently, the seed file is the only way to add new location categories to fly to. You would then need to add the airport/cities to the hashes in the AirportAndCityLookuphelper module.  
<<<<<<< HEAD
-There are helpers in the support folder that allow you to reach real_trips_index page and the real_trip_info pages while writing new tests. Simply call the method in the associated folders and the setup will be complete and those pages will be reachable.
=======
-There are helpers in the support folder that allow you to reach real_trips_index page and the real_trip_info pages while writing new tests. Simply call the method in the associated folders and the setup will be complete and those pages will be reachable.
>>>>>>> b630ee11375cbfdd800e48ad6119919549020a35
