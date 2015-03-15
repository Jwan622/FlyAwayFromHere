class CreateTripInfos < ActiveRecord::Migration
  def change
    create_table :trip_infos do |t|
      t.string :title
      t.string :city
      t.text :short_description
      t.text :long_description
      t.string :airport

      t.timestamps null: false
    end
  end
end
