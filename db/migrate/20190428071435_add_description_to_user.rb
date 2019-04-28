class AddDescriptionToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :description, :text, limit: 1000
    change_column :users, :username, :string, null: false, limit: 20
  end

  def down
    remove_column :users, :description, :text, limit: 1000
    change_column :users, :username, :string, null: false
  end
end
