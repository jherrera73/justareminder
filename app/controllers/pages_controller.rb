class PagesController < ApplicationController

  def index
    @title = "Home"
  end
  
  def reminders
    user = User.find_by_public_key(params[:id])
    return @reminders = user.reminders.opened.order("start ASC") if user.present?
  
    contact = Contact..find_by_public_key(params[:id])
    return @reminders = user.reminders.opened.order("start ASC") if contact.present?
    
    return @reminders
  end

end
