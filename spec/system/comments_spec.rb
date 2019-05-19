require "rails_helper"

describe 'コメント投稿機能', type: :system, js: true do
  let(:user) { FactoryBot.create(:user, confirmed_at: Time.now) }
  let!(:post) { FactoryBot.create(:post, user: user) }
  let(:comment) { FactoryBot.create(:comment, user: user, post: post)}
  before do
    login_as(user, :scope => :user)
    visit posts_path
    click_on "テストレッスン"
    fill_in 'text_area', with: comment
    click_on 'コメントする'
  end

  context 'コメントを投稿したとき' do
    let(:comment) { "参加したいです。" }
    it "コメントが表示される" do
      expect(page).to have_content "参加したいです。"
      expect(page).to have_content "コメントを削除する"
    end
  end

  context '空のコメントを投稿したとき' do
    let(:comment) { "" }
    it "コメントが表示されない" do
      expect(page).not_to have_content "コメントを削除する"
    end
  end

  context 'コメントを削除したとき' do
    let(:comment) { "参加したいです。" }
    before do
      click_on "コメントを削除する"
      page.accept_confirm 'コメントを削除します。よろしいですか？'
    end

    it 'コメントが削除される' do
      expect(page).not_to have_content "参加したいです。"
    end
  end

end