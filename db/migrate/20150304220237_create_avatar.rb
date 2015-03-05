class CreateAvatar < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.references :user, index: true
      t.references :trip, index: true
      t.references :category, index: true
    end
    add_foreign_key :avatars, :users
    add_foreign_key :avatars, :trips
    add_foreign_key :avatars, :categories
  end
end
