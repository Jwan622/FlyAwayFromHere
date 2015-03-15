class AddDepartureColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :departure_airport, :string
  end
end
