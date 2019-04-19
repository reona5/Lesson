class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post: @post)
    toggle
    @post_reload
  end

  private

  def toggle
    if @like
      return head :unprocessable_entity unless @like.destroy
    else
      @like = current_user.likes.build(post: @post)
      return head :unprocessable_entity unless @like.save
    end
    head :ok
  end
end
