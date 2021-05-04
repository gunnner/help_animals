class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    @url = 'https://help-animals.pp.ua/passwordrecovery/resetpassword'
    mail(to: @user.email, subject: 'Help animals.')
  end
end
