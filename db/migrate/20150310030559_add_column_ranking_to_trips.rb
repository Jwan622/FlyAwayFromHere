class AddColumnRankingToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :ranking, :decimal, precision: 5, scale: 2
  end
end
