class PagesController < ApplicationController

  def index
    @title = "Home"
  end
  
  def reminders
    found_user = User.find_by_public_key(params[:id])
    @reminders = found_user.reminders.opened.order("start ASC") if found_user.present?
  
    found_contact = Contact.find_by_public_key(params[:id])
    @reminders = found_contact.reminders.opened.order("start ASC") if found_contact.present?
    
    return @reminders
  end

end

