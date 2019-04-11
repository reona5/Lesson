# frozen_string_literal: true

class OmniauthCallbacksController < ApplicationController
  def twitter
    @user = User.from_omniauth(request.env['omniauth.auth'].except('extra'))

    if @user.persisted?
      flash.notice = "こんにちは、#{@user.username} さん！"
      sign_in_and_redirect @user
    else
      session['devise.user_attributes'] = @user.attributes
      redirect_to new_user_registration_url
    end
  end
end
