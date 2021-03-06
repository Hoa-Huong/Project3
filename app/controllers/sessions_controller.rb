class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or root_url
    else
      flash.now[:danger] = "Tên đăng nhập hoặc mật khẩu không đúng"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def check_user_present
    @user = User.find_by email: params[:session][:email].downcase
    return if @user

    flash[:danger] = t "email_password"
    render :new
  end
end
