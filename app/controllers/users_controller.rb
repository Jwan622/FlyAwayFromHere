class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      valid_user_signup(user)
    else
      invalid_user_signup(user)
    end
  end

  def show
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(update_user_params)
      redirect_to root_path, notice: "You have updated your origin city."
    else
      redirect_to root_path, flash: { error: "We don't fly from that city hub...yet." }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :first_name,
                                 :last_name,
                                 :email,
                                 :street,
                                 :city,
                                 :state,
                                 :country,
                                 :password,
                                 :password_confirmation
                                 )
  end

  def update_user_params
    params.require(:user).permit(:city)
  end

  def invalid_user_signup(user)
    flash[:error] = user.errors.full_messages
    render new_user_path
  end

  def valid_user_signup(user)
    user.save
    session[:user_id] = user.id
    flash[:success] = "Signup Successful"
    redirect_to root_path
  end
end
