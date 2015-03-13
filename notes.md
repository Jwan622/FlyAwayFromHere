Things learned from this project:

# 1) presenter puts stuff in display format. convenience methods. allows view to stay slim and not do logic in view.

# 2) FindTrip here is a service object.
# 3) The controller's job is the transform data from request with conditionals and give it to different objects. The trip searcher does
#    not need to know about how the request parameters come through. IT just needs to know how to search terms. The goal is to decouple
#    and keep ojbects as dumb as possible. This way, refactoring like I'm doing now is easier in the future.
# 4) For the love of god, look at the api first next time before building a rails app that uses an api.
