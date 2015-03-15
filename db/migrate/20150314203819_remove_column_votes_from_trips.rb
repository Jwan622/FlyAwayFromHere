class RemoveColumnVotesFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :downvotes, :integer
    remove_column :trips, :upvotes, :integer
  end
end
