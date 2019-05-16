# frozen_string_literal: true

require 'rails_helper'

describe '投稿管理機能', type: :system do
  let(:user) { FactoryBot.create(:user, confirmed_at: Time.now) }
  let!(:post) { FactoryBot.create(:post, user: user) }

  before do
    login_as(user, :scope => :user)
    visit posts_path
  end

  shared_examples_for 'ユーザーが作成した投稿が表示される' do
    it { expect(page).to have_content 'テストレッスン' }
  end

  describe '一覧表示機能' do
    context 'ユーザーがログインしているとき' do
      it_behaves_like 'ユーザーが作成した投稿が表示される'
    end
  end

  describe '詳細表示機能' do
    before do
      visit post_path(post)
    end

    context 'ユーザーがログインしているとき' do
      it_behaves_like 'ユーザーが作成した投稿が表示される'
    end
  end

  describe '新規作成機能' do
    before do
      visit new_post_path
    end

    context '新規画面で名称を登録したとき' do
      let(:post) { FactoryBot.create(:post, name: 'Rubyで遊びます！', user: user) }
      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: "レッスン「Rubyで遊びます！」を登録しました。"
      end
    end
  end
end