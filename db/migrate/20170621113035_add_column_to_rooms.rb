class AddColumnToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :country, :string
    add_column :rooms, :prefecture, :string
    add_column :rooms, :city, :string
    add_column :rooms, :address, :string
  end
end
