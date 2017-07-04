class ChangeColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :check_in, :string
    remove_column :orders, :check_out, :string
    add_column :orders, :check_in, :date, null: false
    add_column :orders, :check_out, :date, null: false
  end
end
