require 'test_helper'

class ReminderMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:one)
    @reminders = reminders(:one)
  end
  
  test "open_reminders" do
    mail = ReminderMailer.open_reminders(@user, @reminders)
    assert_equal "Reminder for : " + @reminders.description, mail.subject
    assert_equal ["jherrera@comcast.net"], mail.to
    assert_equal ["remindersupdate@justareminder.com"], mail.from
  end
  
  test "send_open_reminders" do
    ReminderMailer.send_open_reminders
    
    reminder_email = ActionMailer::Base.deliveries.last
    
    assert_nil reminder_email
  end
  
  test "open_reminders_delivers" do
    ReminderMailer.open_reminders(@user, @reminders).deliver
    
    reminder_email = ActionMailer::Base.deliveries.last
    
    assert_not_nil reminder_email
  end

end
