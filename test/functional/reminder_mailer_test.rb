require 'test_helper'

class ReminderMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:two)
    @contact = contacts(:one)
    @reminders = reminders(:three)
  end
  
  test "open_reminders" do
    mail = ReminderMailer.open_reminders(@user)
    assert_equal "Reminders for " + @user.full_name, mail.subject
    assert_equal ["MadMstt@comcast.net"], mail.to
    assert_equal ["remindersupdate@justareminder.com"], mail.from
  end
  
  test "send_open_reminders" do
    ReminderMailer.send_open_reminders
    
    reminder_email = ActionMailer::Base.deliveries.last
    
    assert_nil reminder_email
  end
  
  test "open_reminders_delivers" do
    ReminderMailer.open_reminders(@user).deliver
    
    reminder_email = ActionMailer::Base.deliveries.last
    
    assert_not_nil reminder_email
  end
  
  test "open_reminders_contacts_delivers" do
    ReminderMailer.open_reminders_contact(@contact).deliver
    
    reminder_email = ActionMailer::Base.deliveries.last
    
    assert_not_nil reminder_email
  end

end
