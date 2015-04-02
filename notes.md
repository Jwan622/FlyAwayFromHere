# Things learned from this project:

1) presenter puts stuff in display format. convenience methods. allows view to stay slim and not do logic in view.

2) FindTrip here is a service object.
3) The controller's job is the transform data from request with conditionals and give it to different objects. The trip searcher does
   not need to know about how the request parameters come through. IT just needs to know how to search terms. The goal is to decouple and
   keep ojbects as dumb as possible. This way, refactoring like I'm doing now is easier in the future.
4) For the love of god, look at the api first next time before building a rails app that uses an api.
5) In FindTrip, the find_all method was originally written like this:

 if qpx_search["trips"]["tripOption"]
   qpx_search["trips"]["tripOption"].map do...

 but that was making two calls to the api which was inefficient. But strangely, the first api call would
 populate with real data but the second one would always come back blank. Why is this?

 6) activaation mailers are harder to build than previously though. The email needs to have a link that hits the edit action of the AccountActivationsController which should turn the user's activated state to true. That link needs to have the activation token and the user's email (the email is to lookup the user). When a user logs in, that's when you actually check the user's activated state, which only is true if the user clicks the email. Alternatively, a user can just login via oauth and now the user is logged in as current_user and can use the site.



Classes:
- The Real Trip class takes in the real api data and wraps them in a Ruby object.
  - Inside this Real Trip Class, we take the airport code that comes back from the api,
    converts the code to an airport slug, and we do a lookup for the category based on the airport slug.
    We then use the Category name. For instance, we go from "LON" to "london" to "London".

- I chose to seperate out the service object (QPX Service) and the PORO (Find_trip). The Find trip calls the service object
  and iterates over the service object



Refactor possibilities:
* I was thinking that I do not like how I setup Category in the database. I think in later iterations, I should have a  
  separate table for airport codes. A Category should have many airport codes so an admin can simply add a Category, give  
  category a name like "St. Petersberg" and give the appropriate airport codes which there will be several of (local,  
  international airports, etc.)

* In find_trip.rb, clean the arguments in the initialize method. I think this might actually be easier to read
  and prevents me from changing the internals of the object during the code.

* Naming of the POROs.

* Take out the logic from the Find Trip for cleaning and make a cleaner class.
