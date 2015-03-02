class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.integer :role
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
