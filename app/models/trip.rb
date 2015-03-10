class Trip < ActiveRecord::Base

  before_save :ranking
  has_many :photos

  has_many :categories_trip
  has_many :categories, through: :categories_trip

  validates :title, presence: true,
                    uniqueness: true
  validates :price, presence: true,
                    numericality: { only_integer: true,
                                    greater_than: 3999,
                                    less_than: 200000 }
  validates :short_description, presence: true
  validates :categories, presence: true
  validates :photos, presence: true

  def ranking
    self.ranking = (upvotes.to_f / downvotes.to_f) || 0
  end

  def self.bargain_for_user(price_level)
    joins(:categories).where("price <= :price_level", { price_level: price_level }).order(price: :asc)
  end

  def self.sort_by_category(category)
    joins(:categories).where("categories.slug = ?", category).order(ranking: :desc)
  end

  def self.all_trips_by_ranking
    includes(:categories).all.order(ranking: :desc)
  end
end
