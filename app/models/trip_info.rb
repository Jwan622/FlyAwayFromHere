class TripInfo < ActiveRecord::Base
  extend AirportAndCityLookupHelper

  has_many :photos

  def self.find(airport)
    find_by(:airport => airport_converter[airport])
  end
end
