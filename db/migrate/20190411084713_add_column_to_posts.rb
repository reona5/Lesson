# frozen_string_literal: true

class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :lesson_at, :datetime, null: false
    add_column :posts, :place, :string, null: false
  end
end
