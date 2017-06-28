class AddBedToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :bed, :integer, null: false
    change_column_null :rooms, :country, false
    change_column_null :rooms, :prefecture, false
    change_column_null :rooms, :city, false
    change_column_null :rooms, :address, false
  end
end
