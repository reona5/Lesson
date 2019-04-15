module ControllerMacros
  def login_admin(admin)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in create(:admin)
  end

  def login_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = create(:user)
    user.confirm!
    sign_in user
  end
end