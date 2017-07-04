class AddMessagesToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :messages, :text, null: false
    add_column :orders, :confirmation, :boolean, null: false
    add_column :orders, :user_id, :integer, null: false
    add_column :orders, :room_id, :integer, null: false
  end
end
