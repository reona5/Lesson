# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content, limit: 500, null: false
      t.references :user
      t.references :post

      t.timestamps
    end
  end
end
