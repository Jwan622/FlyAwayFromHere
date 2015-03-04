class ChangeColumnNameTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :rating, :ranking
    remove_column :trips, :category_id
    add_column :trips, :airline, :string
    add_column :trips, :flight_date, :datetime
  end
end
