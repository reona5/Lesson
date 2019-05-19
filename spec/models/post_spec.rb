require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = @user.posts.new(name: "title", tag_list: "Ruby", description: "description", lesson_at: "2019-04-01 12:00", place: "北海道")
  end

  context "投稿が有効であるとき" do
    it "投稿が登録される" do
      expect(@post).to be_valid
    end
  end

  context "投稿が無効であるとき" do
    it "タイトルが存在しない" do
      @post.name = ""
      expect(@post).not_to be_valid
    end

    it "タグが存在しない" do
      @post.tag_list = ""
      expect(@post).not_to be_valid
    end

    it "詳細が存在しない" do
      @post.description = ""
      expect(@post).not_to be_valid
    end

    it "予定日時が存在しない" do
      @post.lesson_at = ""
      expect(@post).not_to be_valid
    end

    it "予定エリアが存在しない" do
      @post.place = ""
      expect(@post).not_to be_valid
    end
  end
end
