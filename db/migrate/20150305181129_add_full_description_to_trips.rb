class AddFullDescriptionToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :full_description, :text
  end
end
