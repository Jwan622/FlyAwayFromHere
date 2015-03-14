module RedirectHelper
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    if logged_in_from_signup_page
      session[:forwarding_url] = root_path
    else
      session[:forwarding_url] = request.referer
    end
  end

  private

  def logged_in_from_signup_page
    request.post? && ((request.referer == new_user_url) || (request.referer == users_url))
  end
end
