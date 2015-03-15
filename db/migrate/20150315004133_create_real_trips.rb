class CreateRealTrips < ActiveRecord::Migration
  def change
    create_table :real_trips do |t|
      t.integer :price
      t.datetime :departure_date
      t.datetime :return_date

      t.timestamps null: false
    end
  end
end
