class ApplicationController < ActionController::Base
  # include RedirectHelper
  # include AirportAndCityLookupHelper

  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_login
    unless logged_in?
      redirect_to root_path, alert: "Your Flight is Delayed until you log in."
    end
  end

  def logged_in?
    current_user != nil
  end

  def admin?
    current_user && current_user.admin?
  end
  helper_method :admin?
end
