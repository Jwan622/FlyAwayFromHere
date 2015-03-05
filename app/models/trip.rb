class Trip < ActiveRecord::Base
  has_many :photos

  has_many :categories_trips
  has_many :categories, through: :categories_trips
end
