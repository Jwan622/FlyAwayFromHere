class ApplicationController < ActionController::Base
  # include RedirectHelper
  # include AirportAndCityLookupHelper

  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_path if current_user.nil?
  end

  def itinerary
    Itinerary.new(session[:itinerary])
  end
  helper_method :itinerary
end
