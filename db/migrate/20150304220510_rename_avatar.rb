class RenameAvatar < ActiveRecord::Migration
  def change
    rename_table :avatars, :photos
  end
end
