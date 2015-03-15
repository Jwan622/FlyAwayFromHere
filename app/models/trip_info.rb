class TripInfo < ActiveRecord::Base
  include AirportAndCityLookupHelper

  has_many :photos

  def self.find(airport)
    find_by(:airport => airport)
  end
end
