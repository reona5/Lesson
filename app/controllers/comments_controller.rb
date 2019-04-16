# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.user_id
    if @comment.save
      redirect_to posts_url, notice: "レッスン「#{@post.name}」にコメントを投稿しました。"
    else
      render :show
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
