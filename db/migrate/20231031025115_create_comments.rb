class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user, null: false, foreign_key: true
      t.integer :post, null: false, foreign_key: true
      t.text :text, null: false
      t.timestamps
    end
  end
end
