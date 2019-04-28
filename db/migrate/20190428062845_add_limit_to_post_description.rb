class AddLimitToPostDescription < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :description, :text, limit: 1000, null: false
  end

  def down
    change_column :posts, :description, :text, null: false
  end
end
