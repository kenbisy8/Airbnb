class RemoveNicknameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :nickname, :string
    add_column :users, :name, :string, unique: true
  end
end
