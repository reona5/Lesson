class PagesController < ApplicationController

  def index
  end

  def show
    @user = User.find_by(id: @post.user_id)
  end
end
