module TestHelperMethods
  def log_in(as: create(:user))
    fill_in "session[username]", with: as.username
    fill_in "session[password]", with: as.password
    click_button "Login"
  end
end
