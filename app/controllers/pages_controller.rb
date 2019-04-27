class PagesController < ApplicationController

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end
end
