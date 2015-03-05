class RenameColumn < ActiveRecord::Migration
  def self.up
    rename_column :trips, :flight_date, :departure_date
  end

  def self.down
    rename_column :trips, :departure_date, :flight_date
  end
end
