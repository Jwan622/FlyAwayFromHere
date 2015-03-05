class SessionsController < ApplicationController
  def create
    if auth_hash
      @user             = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = @user.id
      flash[:notice]    = "Welcome back to the skies#{@user.username}"
      redirect_lender_or_borrower(@user)
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
    if user && user.authenticate(session_password)
      session[:user_id] = user.id
      flash[:notice] = "Welcome back to the skies#{user.username}"
      redirect_lender_or_borrower(user)
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


  def redirect_lender_or_borrower(user)
    if user.flyer?
      redirect_back_or(root_path)
    # else
      # redirect_to tenant_dashboard_path(slug: user.tenant.slug)
    end
  end
end
