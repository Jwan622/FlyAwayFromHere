class Category < ActiveRecord::Base
  self.inheritance_column = nil
  before_save :create_slug
  before_save :downcase_type

  has_many :photos

  def create_slug
    self.slug = name.parameterize
  end

  def downcase_type
    self.type = type.downcase
  end

  def self.location_categories
    where(type: "location").order(:name)
  end
end
