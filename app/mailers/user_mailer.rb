class UserMailer < ActionMailer::Base
  default from: "projfolio@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  #
 
  def welcome_email(user)
    @user = user
    @url = "http://projfolio.herokuapp.com/signin"
    mail :to => @user.email, :subject => "Welcome to Projfolio"
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Projfolio Password Reset"
  end

end
