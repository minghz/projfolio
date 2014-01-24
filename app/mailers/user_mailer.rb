class UserMailer < ActionMailer::Base
  default from: "wrapel@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  #
 
  def welcome_email(user)
    @user = user
    @url = "http://wrapel.herokuapp.com/signin"
    mail :to => @user.email, :subject => "Welcome to Wrapel"
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Wrapel Password Reset"
  end

end
