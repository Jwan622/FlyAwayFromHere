class UserMailer < ApplicationMailer                    # ~> NameError: uninitialized constant ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset
    @greeting = "Hi"
    mail to: "to@example.org"
  end
end

# ~> NameError
# ~> uninitialized constant ApplicationMailer
# ~>
# ~> /Users/Jwan/Dropbox/Turing/projects/FlyAwayFromHere/app/mailers/user_mailer.rb:1:in `<main>'
