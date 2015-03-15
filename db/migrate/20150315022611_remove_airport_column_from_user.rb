class RemoveAirportColumnFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :departure_airport, :string
  end
end
