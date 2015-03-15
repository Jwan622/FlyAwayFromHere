class AddTripInfoColumnToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :trip_info_id, :integer
  end
end
