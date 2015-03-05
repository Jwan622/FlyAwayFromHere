class RenameDescriptionTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :description, :short_description
  end
end
