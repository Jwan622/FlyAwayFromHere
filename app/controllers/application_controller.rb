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
      redirect_to root_path, alert: "You must login first before flying."
    end
  end

  def itinerary
    Itinerary.new(session[:itinerary])
  end
  helper_method :itinerary

  def logged_in?
    current_user != nil
  end
end
