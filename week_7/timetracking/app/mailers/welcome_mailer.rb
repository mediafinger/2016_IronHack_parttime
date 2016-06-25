class WelcomeMailer < ApplicationMailer
  def welcome_mail(user)
    @user = user

    mail(to: @user.email, subject: "Welcome to my site #{@user.name}")
  end
end
