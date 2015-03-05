class AddAmountToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :return_date, :datetime
  end
end
