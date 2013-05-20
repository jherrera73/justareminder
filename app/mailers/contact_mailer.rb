class ContactMailer < ActionMailer::Base
  default from: "registration@justareminder.com"

  def contact_confirmation(user, contact)
    @user = user
    @contact = contact
    mail to: contact.email, bcc: user.email
  end
end
