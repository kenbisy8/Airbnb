class AddImageToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :image, :string, null: false
  end
end
