class ReminderMailer < ActionMailer::Base
  default from: "remindersupdate@justareminder.com"

  #The main method to send all users an email of all open reminders
  def self.send_open_reminders
    @users = User.all
      
    @users.each do |user|    
        
      @reminders = user.reminders.opened 
      
      if @reminders.count > 0
        open_reminders(user).deliver 
      end   
    end
    
    @contacts = Contact.all
    
    @contacts.each do |contact|    
        
      @reminders = contact.reminders.opened 
      
      if @reminders.count > 0
        puts "Sendng email..."
        open_reminders_contact(contact).deliver 
        puts "Complete"
      end   
    end
    
  end
  
  def open_reminders(user)
    @user = user
    
    @reminders = user.reminders.opened 
      
    
    mail(:to => user.email, :subject => "Reminders for " + @user.full_name)
  end
  
  def open_reminders_contact(contact)
    @contact = contact
    
    @reminders = contact.reminders.opened  
    
    mail(:to => contact.email, :subject => "Reminders for " + @contact.full_name)
  end
end
