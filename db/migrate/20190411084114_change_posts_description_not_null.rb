# frozen_string_literal: true

class ChangePostsDescriptionNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :description, false
  end
end
