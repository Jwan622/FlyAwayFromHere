class SessionsController < ApplicationController
  include RedirectHelper
  include AccountActivationsHelper

  def create
    if auth_hash
      @user             = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = @user.id
      flash[:notice]    = "Welcome back to the skies #{@user.username}"
      redirect_flyer_or_admin(@user)
    else
      store_location
      authenticate_user(User.find_by(session_username))
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have successfully landed your plane"
    redirect_to root_path
  end

  private

  def session_username
    params.require(:session).permit(:username)
  end

  def session_password
    params.require(:session).permit(:password)[:password]
  end

  def authenticate_user(user)
    if user && !user.activated
      message = "Account not activated. Check your email for activation link."
      flash[:error] = message
      redirect_to root_path
    elsif user && user.authenticate(session_password)
      log_in(user)
      flash[:notice] = "Welcome back to the skies #{user.username}"
      redirect_flyer_or_admin(user)
    else
      invalid_login
    end
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def invalid_login
    flash[:error] = "Invalid Login"
    redirect_to root_path
  end


  def redirect_flyer_or_admin(user)
    if user.flyer?
      redirect_back_or(root_path)
    end
  end
end
