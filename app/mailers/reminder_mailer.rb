class ReminderMailer < ActionMailer::Base
  default from: "remindersupdate@justareminder.com"

  #The main method to send all users an email of all open reminders
  def self.send_open_reminders
    @users = User.all
      
    @users.each do |user|    
        
      @reminders = user.reminders.opened 
      open_reminders(user, @reminders).deliver if @reminders.count > 0
          
    end
  end
  
  def open_reminders(user, reminders)
    @user = user
    @reminders = reminders
    
    mail(:to => user.email, :subject => "Reminders for : " + @user.full_name)
  end
end
