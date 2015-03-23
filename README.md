# FlyAwayFromHere

# Steps to setup app and run the app in development. Perform these steps if you want to test the functionality, or run the test suite in development.
-In terminal for MacOSX, type in git clone git@github.com:Jwan622/FlyAwayFromHere.git
-CD into that directory and run bundle install to download dependencies. Download bundle if you don't already have bundle.
-To run in development, run "rails server" or "rails s" and then visit localhost:3000 or whatever the port number is that appears after "rails s"
-To run test suite, run "rake test" or simply "rake"

# Using the app
-there are 3 main ways to use the application. You can use the planner which is on the home page. It has 5 select boxes for which a user can state their preferences. The second way is to simply select a location category which is located undernear the praise bar on the home page. These category buttons will search for trips in the future at the desired location. Third, you can hit the big red button which will search all of the locations in the app for trips underneath a price threshold of $500 for dates in the future.

# The code:
-Please feel free to inspect the code quality. The main functionality is within:
  -app/models/real_trip.rb
  -app/controllers/real_trips_controller.rb
  -app/services/find_trip.rb
  -app/services/qpx_service.rb

### This app is a Turing School Personal project that incorporates the following functionality:
-Consuming the QPX flight-data API
-Twitter Oauth
-Friendly forwarding
-Presenter classes for controller abstraction
-Non-databased backed models/POROs for converting API data into usable Ruby objects.
-PORO's for activerecord ducktyping. Since I was using Non-databased backed models, I needed to create a PORO to simulate ActiveRecord methods to create/modify the non-databased backed models and make them available for use in the controller/views.
-Jquery/Javascript filtering
-Twitter Bootstrap

## Dependencies
-Factory girl (creates model factories for testing)
-Figaro (allwos me to hide auth keys in ENV variables)
-Twitter Oauth (allows users to login with Twitter authentication)
-Twitter Bootstrap (CSS abstraction library)
-Paperclip (allows users to upload photos and attach photos with a databsae model)
-Faraday (estblishes connection with external API)
-VCR (records API data for usage in testing)
-Mocha (stubbing library)


### If you want to create more tests, some key points to remember:
-You can only search for trips that are categories in the database. So if you want to fly to Boston, you need to create a Category in the
 seed file or create a Category via the web app as admin (not implemented yet). You also need to add the airport/cities to the hashes in the
 AirportAndCityLookuphelper module.
-There are helpers in the support folder that allow you to reach real_trips_index page and the real_trip_info pages.
