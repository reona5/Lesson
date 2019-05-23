require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    @comment = FactoryBot.create(:comment, user: @user, post: @post)
  end

  context 'コメントが有効であるとき' do
    it 'コメントが登録される' do
      expect(@comment).to be_valid
    end
  end

  context 'コメントが無効であるとき' do
    it 'コメントが登録されない' do
      @comment.content = ""
      expect(@comment).not_to be_valid
    end
  end
end
