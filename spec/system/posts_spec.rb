# frozen_string_literal: true

require 'rails_helper'

describe '投稿管理機能', type: :system do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  before do
    login_user
    visit user_path
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user }

      it 'ユーザーAが作成したタスクが表示される' do
        # 作成済みの投稿のタイトルが画面上に表示されていることを確認
        expect(page).to have_content '最初の投稿'
      end
    end
  end
end
