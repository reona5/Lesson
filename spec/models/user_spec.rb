# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  include CarrierWave::Test::Matchers
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザが有効であるとき' do
    it 'ユーザが登録される' do
      expect(@user).to be_valid
    end

    it "アバターが指定した形式である" do
      formats = %w(jpg jpeg gif png)
      formats.each do |format|
        image_path = File.join(Rails.root, "spec/fixtures/sample.#{format}")
        user = FactoryBot.build(:user, avatar: File.open(image_path))
        expect(user).to be_valid
      end
    end
  end

  context 'ユーザが無効であるとき' do
    it 'ユーザ名が存在しない' do
      @user.username = ""
      expect(@user).not_to be_valid
    end

    it 'ユーザ名が長過ぎる' do
      @user.username = "a"*21
      expect(@user).not_to be_valid
    end

    it 'メールアドレスが存在しない' do
      @user.email = ""
      expect(@user).not_to be_valid
    end

    it 'メールアドレスが既に登録されている' do
      user = FactoryBot.build(:user, email: "test@example.com")
      expect(user).not_to be_valid
    end

    it 'パスワードが存在しない' do
      @user.password = ""
      expect(@user).not_to be_valid
    end

    it 'パスワードが短すぎる' do
      @user.password = "a"*5
      expect(@user).not_to be_valid
    end

    it 'アバターが指定した形式でない' do
      image_path = File.join(Rails.root, "spec/fixtures/sample.rb")
      user = FactoryBot.build(:user, avatar: File.open(image_path))
      expect(user).not_to be_valid
    end
  end
end
