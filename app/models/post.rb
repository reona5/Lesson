# frozen_string_literal: true

class Post < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :lesson_at, presence: true
  validates :place, presence: true

  belongs_to :user
end
