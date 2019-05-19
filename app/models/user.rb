# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 1000 }
  validates :password, length: { minimum: 6 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth['provider'], uid: auth['uid']) do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.username = auth['info']['nickname']
      # user.remote_avatar_url = auth['info']['image']
      # user.email = User.dummy_email(auth)
      # user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes']) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  def remember_me
    true
  end

  # private

  # def self.dummy_email(auth)
  #   "#{auth.uid}-#{auth.provider}@example.com"
  # end
end
