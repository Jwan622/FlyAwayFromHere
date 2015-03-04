class RenameTableJoinedTables < ActiveRecord::Migration
  def self.up
    rename_table :joined_tables, :categories_trips
  end
  def self.down
    rename_table :categories_trips, :joined_tables
  end
end
