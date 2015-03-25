class UserMailer < ApplicationMailer                    # ~> NameError: uninitialized constant ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end
end
