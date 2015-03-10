class CategoriesTrip < ActiveRecord::Base
  belongs_to :trip
  belongs_to :category
end
