class AddDestinationColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :destination_airport, :string
  end
end
