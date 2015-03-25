module LoginHelper
  def log_in(as: create(:user))
    fill_in "session[username]", with: as.username
    fill_in "session[password]", with: as.password
    click_button "Login"
  end

  def log_in_as(user, options = {})
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { username:    user.username,
                                  password:    password
                                }
    else
      session[:user_id] = user.id
    end
  end

  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  private

  def integration_test?
    defined?(post_via_redirect)
  end
end
