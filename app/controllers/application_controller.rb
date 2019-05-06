# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :tags_search

  def after_sign_in_path_for(_resource)
    flash.notice = "こんにちは、#{current_user.username} さん！"
    posts_path
  end

  def tags_search
    @q = Post.ransack(params[:q])
  end

  private

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar, :avatar_cache, :description])
end
end
