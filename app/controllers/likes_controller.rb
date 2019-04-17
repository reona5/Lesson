class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @post = post.find(params[:post_id])
    @post.like(current_user)
  end

  def destroy
    @post = Like.find(params[:id]).post
    @post.dislike(current_user)
  end
end
