class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      valid_user_signup(@user)
    else
      invalid_user_signup(@user)
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(edited_user_params)
      redirect_to root_path, notice: "You have succesfully updated your profile."
    elsif @user.update_attributes(update_user_params)
      redirect_to root_path, notice: "You have updated your origin city."
    else
      flash.now[:error] = @user.errors.full_messages
      render :edit
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

  def edited_user_params
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

  def invalid_user_signup(user)
    flash[:error] = user.errors.full_messages
    render new_user_path
  end

  def valid_user_signup(user)
    user.save
    user.send_activation_email
    flash[:success] = "Please check your email to activate your account."
    redirect_to root_path
  end

  def redirected_from_edit_page?
    request.referer[-4..-1] == "edit"
  end
end
