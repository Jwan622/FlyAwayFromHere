class AddDepartureCityToUser < ActiveRecord::Migration
  def change
    add_column :users, :departure_city_slug, :string
  end
end
