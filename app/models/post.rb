# frozen_string_literal: true

class Post < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :lesson_at, presence: true
  validates :place, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  # 投稿にいいねがついているかどうか
  def like?(user)
    like_users.include?(user)
  end
end
