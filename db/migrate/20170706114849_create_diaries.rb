class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|
      t.text :article, null: false
      t.string :article_title, null: false
      t.string :article_image
      t.string :nation_name, null: false
      t.string :city_name, null: false
      t.boolean :publicity, null: false
      t.integer :article_user_id, null: false
      t.timestamps
    end
  end
end
