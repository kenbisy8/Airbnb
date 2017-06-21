class RemoveAdressFromRooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :rooms, :adress, :string
  end
end
