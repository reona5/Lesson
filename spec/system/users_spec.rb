require "rails_helper"

describe "ユーザー管理機能", type: :system, js: true do
  describe '新規作成機能' do
    before do
      visit new_user_registration_path
      fill_in "ユーザ名", with: "testuser"
      fill_in "メールアドレス", with: "test@examples.com"
      fill_in "パスワード", with: testpass
      fill_in "パスワード（確認用）", with: "testpass"
      click_on "登録する"
    end

    context '有効な情報を入力したとき' do
      let(:testpass) { "testpass" }
      it 'トップページに遷移する' do
        expect(page).to have_selector '.alert', text: '本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。'
      end
    end

    context '無効な情報を入力したとき' do
      let(:testpass) { "pass" }
      it 'エラーとなる' do
        expect(page).to have_css('div#error_explanation')
      end
    end
  end


  describe 'ログイン機能' do
    let!(:user) { FactoryBot.create(:user, email: "test@examples.com",  confirmed_at: Time.now) }
    before do
      visit new_user_session_path
      fill_in "メールアドレス", with: "test@examples.com"
      fill_in "パスワード", with: testpass
      click_on "ログインする"
    end

    context '有効な情報を入力したとき' do
      let(:testpass) { "testpass" }
      it '記事一覧ページに遷移する' do
        expect(page).to have_selector '.alert'
      end
    end

    context '無効な情報を入力したとき' do
      let(:testpass) { "pass" }
      it 'エラーとなる' do
        expect(page).not_to have_selector '.alert'
      end
    end
  end

  describe '編集機能' do
    let!(:user) { FactoryBot.create(:user, email: "test@examples.com",  confirmed_at: Time.now) }
    before do
      login_as(user, :scope => :user)
      visit edit_user_registration_path
      image_path = File.join(Rails.root, "spec/fixtures/sample.png")
      attach_file('プロフィール画像', image_path, make_visible: true)
      fill_in 'ユーザ名', with: 'TARO'
      fill_in 'メールアドレス', with: 'taro@email.com'
      fill_in 'プロフィール', with: 'Rubyが得意です。'
      fill_in 'パスワード', with: 'test2pass'
      fill_in 'パスワード（確認用）', with: 'test2pass'
      fill_in '現在のパスワード', with: testpass
      click_on '変更する'
    end

    context '有効な情報を入力したとき' do
      let(:testpass) { "testpass" }
      it 'ユーザ情報の変更確認メールが送信される' do
        expect(page).to have_selector '.alert', text: 'アカウント情報を変更しました。変更されたメールアドレスの本人確認のため、本人確認用メールより確認処理をおこなってください。'
      end
    end

    context '無効な情報を入力したとき' do
      let(:testpass) { "pass" }
      it 'エラーとなる' do
        expect(page).to have_css('div#error_explanation')
      end
    end
  end

  describe '退会機能' do
    let!(:user) { FactoryBot.create(:user, email: "test@examples.com",  confirmed_at: Time.now) }
    before do
      login_as(user, :scope => :user)
      visit edit_user_registration_path
      click_on '退会する'
      page.accept_confirm '本当によろしいですか？'
    end

    it '投稿が削除される' do
      expect{ user.destroy }.to change{ User.count }.by(-1)
    end
  end
end

