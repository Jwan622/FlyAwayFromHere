class DropRealTrips < ActiveRecord::Migration
  def change
    drop_table :real_trips
  end
end
