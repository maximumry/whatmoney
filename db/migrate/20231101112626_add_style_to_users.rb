class AddStyleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :style_id, :integer
  end
end
