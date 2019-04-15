# frozen_string_literal: true

require 'rails_helper'

describe '投稿管理機能', type: :system do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  before do
    login_user
    visit posts_path
  end

  describe '一覧表示機能' do
    context 'ユーザーがログインしているとき' do
      let(:login_user) { user }

      it 'ユーザーが作成したタスクが表示される' do
        # 作成済みの投稿のタイトルが画面上に表示されていることを確認
        expect(page).to have_content 'テストレッスン'
      end
    end
  end
end
