class RemoveColumnFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :departure_city, :string
  end
end
