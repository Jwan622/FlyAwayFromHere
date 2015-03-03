class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|

      t.timestamps null: false
    end
  end
end
