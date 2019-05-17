# frozen_string_literal: true

require 'rails_helper'

describe '投稿管理機能', type: :system, js: true do
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
      fill_in 'タイトル', with: post_name
      fill_in 'タグ', with: 'Ruby'
      fill_in '詳細', with: '遊んでみよう！'
      # fill_in '予定日時', with: '2019-05-30 18:30'
      # DatePickerが立ち上がるためfill_inは使えなかった。
      find('#post_lesson_at').click
      click_link '10'
      click_button 'OK'
      find('#th-6').click
      click_button 'OK'
      find('#tm-30').click
      click_button 'OK'
      select '渋谷・目黒・世田谷', from: '予定エリア'
      click_button '登録する'
    end

    context '新規作成画面でタイトルを入力したとき' do
      let(:post_name) { 'Rubyで遊びます！' }
      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: "Rubyで遊びます！"
        expect(page).to have_content "Rubyで遊びます！"
        expect(page).to have_content "遊んでみよう！"
        expect(page).to have_content "渋谷・目黒・世田谷"
      end
    end

    context '新規作成画面でタイトルを入力しなかったとき' do
      let(:post_name) { '' }
      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content "タイトルを入力してください"
        end
      end
    end
  end

  describe '投稿編集機能' do
    before do
      click_link '編集'
      fill_in 'タイトル', with: post_name
      click_button '更新する'
    end

    context '投稿編集画面でタイトルを入力したとき' do
      let(:post_name) { 'Rubyで遊びます！' }
      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: "Rubyで遊びます！"
        expect(page).to have_content "Rubyで遊びます！"
        expect(page).to have_content "RSpecを教えます。"
        expect(page).to have_content "渋谷・目黒・世田谷"
      end
    end

    context '投稿編集画面でタイトルを入力しなかったとき' do
      let(:post_name) { '' }
      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content "タイトルを入力してください"
        end
      end
    end
  end

  describe '投稿削除機能' do
    before do
      click_link '削除'
      page.accept_confirm 'レッスン「テストレッスン」を削除します。よろしいですか？'
    end

    it '投稿が削除される' do
      expect(page).not_to have_content "RSpecを教えます。"
    end
  end
end