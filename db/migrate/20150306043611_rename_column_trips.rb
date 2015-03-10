class RenameColumnTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :ranking, :upvotes
    add_column :trips, :downvotes, :integer
  end
end
