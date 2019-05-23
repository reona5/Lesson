# frozen_string_literal: true

class AddForeignKeyTrueToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :posts, foreign_key: true
  end
end
