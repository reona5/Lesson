# frozen_string_literal: true

class Post < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :lesson_at, presence: true
  validates :place, presence: true
  validates :tag_list, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  acts_as_taggable

  # ユーザが持っているいいねを探すメソッド
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

#   # ransack　検索できるカラムの制限
#   def .ransackable_attributes(auth_object = nil)
#     %w[tags_name]
#   end

#   def self.ransackable_associations(auth_object = nil)
#     []
#   end
end
