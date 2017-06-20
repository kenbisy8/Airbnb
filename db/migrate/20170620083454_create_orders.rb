class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :persons
      t.integer :all_price
      t.string :check_in
      t.string :check_out
      t.timestamps
    end
  end
end
