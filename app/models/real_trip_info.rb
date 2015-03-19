class RealTripInfo < ActiveRecord::Base
  attr_reader :departure_date,
              :return_date,
              :price

  def initialize(departure_date:, return_date:, price:)
    @departure_date = departure_date
    @return_date = return_date
    @price = price
  end
end
