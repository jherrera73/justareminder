class Message
  require 'twilio-ruby'

  def send_text(mobile, public_key)
    # put your own credentials here
    account_sid = 'AC944a6523fd262f1bc6a43232d15e1822'
    auth_token = '287745c76ba11b166e473f2fd269ac6e'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  
    @client.account.sms.messages.create(
      :from => '+12242655659',
      :to => '+1' + mobile.to_s,
      :body => "You have reminders, please check your e-mail or visit http://justareminder.herokuapp.com/pages/reminders/" + public_key
    )
    
    return true
  
  end
  
  def self.send_text_open_reminders
    @users = User.all
      
    @users.each do |user|    
        
      @reminders = user.reminders.opened.order("start ASC")
      
      if @reminders.count > 0     
        user.send_message 
      end   
    end
    
    @contacts = Contact.all
    
    @contacts.each do |contact|    
        
      @reminders = contact.reminders.opened.order("start ASC")
      
      if @reminders.count > 0
        contact.send_message     
      end   
    end
    
  end
    
end