class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.integer :rating
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :trips, :categories
  end
end
