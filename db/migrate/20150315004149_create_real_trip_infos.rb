class CreateRealTripInfos < ActiveRecord::Migration
  def change
    create_table :real_trip_infos do |t|
      t.integer :price
      t.datetime :departure_date
      t.datetime :return_date

      t.timestamps null: false
    end
  end
end
