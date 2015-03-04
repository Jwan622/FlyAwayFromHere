class CreateJoinedTable < ActiveRecord::Migration
  def change
    create_table :joined_tables do |t|
      t.references :trip, index: true
      t.references :category, index: true
    end
    add_foreign_key :joined_tables, :trips
    add_foreign_key :joined_tables, :categories
  end
end
