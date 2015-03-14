class Category < ActiveRecord::Base
  self.inheritance_column = nil
  before_save :create_slug
  before_save :downcase_type

  has_many :categories_trips
  has_many :trips, through: :categories_trips

  has_many :photos

  def create_slug
    self.slug = name.parameterize
  end

  def downcase_type
    self.type = type.downcase
  end

  def self.quality_categories
    where(type: "quality")
  end

  def self.proximity_categories
    where(type: "proximity")
  end

  def self.activity_categories
    where(type: "activity")
  end

  def self.location_categories
    where(type: "location")
  end
end
