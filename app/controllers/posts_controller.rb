# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[edit destroy update]

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
    @user = User.find_by(id: @post.user_id)
    if params[:tag_name]
      @posts = @posts.tagged_with("#{params[:tag_name]}")
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = current_user.posts.new
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "レッスン「#{@post.name}」を更新しました。"
    else
      render :edit
    end
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: "レッスン「#{@post.name}」を登録しました。"
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :lesson_at, :place, :tag_list)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
