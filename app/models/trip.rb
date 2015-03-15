class Trip < ActiveRecord::Base
  attr_reader :qpx

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

  def qpx
    @qpx ||= QPXService.new
  end

  def ranking
    rand(1..100)
    #state of the art algorithm at the moment...
  end

  def self.by_category(type)
    includes(:categories).where("categories.slug = ?", type).order(ranking: :desc).references(:categories)
  end

  def self.by_plan(quality, location, activity)
    category_slugs = [quality, location, activity].reject(&:empty?)
    # Trip.includes(:categories).select("\"categories\".\"name\" AS the_categories").where("? ALL IN the_categories", ["cat1", "cat2"]).references(:categories).to_sql
    # Category.find_by(name: category_slugs).map(&:trips)
    if category_slugs.count == 3
      includes(:categories).where( { categories: { slug: category_slugs[0] } } ).
                            where( { categories: { slug: category_slugs[1] } } ).
                            where( { categories: { slug: category_slugs[2] } } ).
                            order(ranking: :desc)
    elsif category_slugs.count == 2
      includes(:categories).where( { categories: { slug: category_slugs[0] } } ).
                            where( { categories: { slug: category_slugs[1] } } ).
                            order(ranking: :desc)
    else category_slugs.count == 1
      includes(:categories).where( { categories: { slug: category_slugs[0] } } ).
                            order(ranking: :desc)
    end
  end

  def self.by_plan(quality, location, activity)
  end

  def self.by_price(type)
    joins(:categories).where("price <= :price_level", { price_level: type }).order(price: :asc)
  end

  def self.by_filter(category_array)
    joins(:categories).where( { categories: { slug: category_array[0] } } )
  end

  def self.all_by_ranking
    includes(:categories).all.order(ranking: :desc)
  end

  def self._build_object(data)
    OpenStruct.new(data)
  end
end
