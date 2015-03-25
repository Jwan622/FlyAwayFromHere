class AccountActivationsController < ApplicationController
  include AccountActivationsHelper
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      #the !user.activated this is so someone who gets a hold of the email can't just click on the link and get logged in. It's only good once
      # and then afterwards the user needs to login with the username and password.
      user.update_attribute(:activated, true)
      log_in user
      flash[:success] = "Account activated!"
      redirect_to root_url
    else
      flash[:error] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
