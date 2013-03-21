class ReminderMailer < ActionMailer::Base
  default from: "remindersupdate@justareminder.com"

  #The main method to send all users an email of all open reminders
  def self.send_open_reminders
    
    @users = User.all
    
    @users.each do |user|
      @reminders = Reminder.find_by_user_id(user.id, "Open")
      
      unless @reminders.nil? || @reminders.count == 0
        open_reminders(user, @reminders).deliver
      end
      
    end
  end
  
  def open_reminders(user, reminders)
    @user = user
    
    @reminders = reminders
    
    mail(:to => user.email, :subject => "Reminders for " + user.full_name)
  end
end
