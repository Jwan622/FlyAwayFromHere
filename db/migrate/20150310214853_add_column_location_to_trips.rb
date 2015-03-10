class AddColumnLocationToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :departure_city, :string
    add_column :trips, :arrival_city, :string
  end
end
