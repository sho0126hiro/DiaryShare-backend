class LoginController < ApplicationController
  def create
    login_user = User.find_by(email:params[:email], pass:params[:pass])
    if login_user != nil
      # login_user.regenerate_token # token再生成
      render plain: login_user.token
    else
      render plain: '403 access forbidden', status: 403
    end
  end
end
