class RealTripInfo < ActiveRecord::Base
  attr_reader :departure_date,
              :return_date,
              :price

  def initialize(departure_date:, return_date:, price:)
    @departure_date = Date.parse(departure_date)
    @return_date = Date.parse(return_date)
    @price = price
  end
end
