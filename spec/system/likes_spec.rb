require "rails_helper"

describe 'いいね機能', type: :system, js: true do
  let(:user) { FactoryBot.create(:user, confirmed_at: Time.now) }
  let!(:post) { FactoryBot.create(:post, user: user) }
  let(:like) { FactoryBot.create(:like, user_id: user.id, post_id: post.id) }

  before do
    visit posts_path
  end

  describe 'ログインしていないとき' do
    it 'いいねが押せない' do
      expect(page).not_to have_link '.vertical_liked'
    end
  end

  describe 'ログインしているとき' do
    before do
      login_as(user, :scope => :user)
      find('.vertical_liked').click
    end

    context 'まだいいねをつけていないとき' do
      it 'いいねをつける' do
        expect(page).to have_content '1'
      end
    end

    context '既にいいねをつけているとき' do
      it 'いいねを取り消す' do
      end
    end

    context '投稿一覧画面でいいねをつけたとき' do
      before do
        click_on "テストレッスン"
      end

      it '投稿詳細画面でも既にいいねがついている' do
      end
    end
  end
end
