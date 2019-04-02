class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: "レッスン「#{post.name}」を更新しました。"
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "レッスン「#{@post.name}」を登録しました。"
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_url, notice: "タスク「#{post.name}」を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:name, :description)
  end
end

