class UserMailer < ActionMailer::Base
  default from: "registration@justareminder.com"

  def register_confirmation(user)
    @user = user
    mail to: user.email
  end
end
