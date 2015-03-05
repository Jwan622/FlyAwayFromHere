class Category < ActiveRecord::Base
  self.inheritance_column = nil

  # scope :quality_categories, -> { where(type: "Quality") }

  def self.quality_categories
    where(type: "Quality")
  end

  def self.proximity_categories
    where(type: "Proximity")
  end

  def self.activity_categories
    where(type: "Activity")
  end
end
