class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :room_name, null: false
      t.text :adress, null: false
      t.integer :guest, null: false
      t.integer :price, null: false
      t.string :beds
      t.string :room_type, null: false
      t.timestamps
    end
  end
end
