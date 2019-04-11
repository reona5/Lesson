# frozen_string_literal: true

class Post < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  belongs_to :user
end
