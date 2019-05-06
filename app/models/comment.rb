# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'
  counter_culture :post
  validates :content, presence: true
end
