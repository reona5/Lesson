require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    @like = FactoryBot.create(:like, user: @user, post: @post)
  end

  context 'いいねが有効であるとき' do
    it 'いいねが登録される' do
      expect(@like).to be_valid
    end
  end

  context 'いいねが無効であるとき' do
    it 'ログインしていない' do
      @like.user_id = ""
      expect(@like).not_to be_valid
    end

    it '投稿がない' do
      @like.post_id = ""
      expect(@like).not_to be_valid
    end
  end
end
