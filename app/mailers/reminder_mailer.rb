class ReminderMailer < ActionMailer::Base
  default from: "remindersupdate@justareminder.com"

  #The main method to send all users an email of all open reminders
  def self.send_open_reminders
    @reminders = Reminder.open
      
    @reminders.each do |reminder|
      @user = User.find_by_id(reminder.user_id)
          
      open_reminders(@user, reminder).deliver    
    end
  end
  
  def open_reminders(user, reminder)
    @user = user
    
    @reminder = reminder
    
    mail(:to => user.email, :subject => "Reminder for : " + @reminder.description)
  end
end
