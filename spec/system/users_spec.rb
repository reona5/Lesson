require "rails_helper"

describe "ユーザー管理機能", type: :system, js: true do
  let(:user) { FactoryBot.create(:user, confirmed_at: Time.now) }
  describe '新規作成機能' do
    before do
      visit new_user_registration_path
      fill_in "ユーザ名", with: "testuser"
      fill_in "メールアドレス", with: testemail
      fill_in "パスワード", with: "testpass"
      fill_in "パスワード（確認用）", with: "testpass"
      click_on "登録する"
    end

    context '有効な情報を入力したとき' do
      let(:testemail) {|n| "test#{n}@example.com" }
      it 'トップページに遷移する' do
        expect(page).to have_selector '.alert', text: 'アカウントの有効化について数分以内にメールでご連絡します。'
      end
    end

    context '無効な情報を入力したとき' do
      let(:testemail) { "" }
      it 'エラーとなる' do
        expect(page).to have_css('div#error_explanation')
      end
    end
  end
end