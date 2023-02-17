class UserNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notification_mailer.signup_mail.subject
  #
  def signup_mail(user_data)
    @user_name = user_data.first_name

    mail(to: user_data.email, subject: "Account Created Successfully.")
  end 

  def forget_password_mail(user_data,pwrd)
      @user_name = user_data.first_name
      @new_pwrd = pwrd
      mail(to: user_data.email, subject: "Try again with new password.")
  end
  
end
