class OontactMailer < ActionMailer::Base
  default from: "registration@justareminder.com"

  def contact_confirmation(user, contact)
    @user = user
    @contact = contact
    mail to: user.email
  end
end
