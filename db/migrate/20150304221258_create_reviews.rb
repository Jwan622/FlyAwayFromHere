class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :votes
      t.integer :user_id
      t.integer :trip_id
    end
  end
end
