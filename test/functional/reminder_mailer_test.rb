require 'test_helper'

class ReminderMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:one)
    @reminders = reminders(:one)
  end
  
  test "open_reminders" do
    mail = ReminderMailer.open_reminders(@user, @reminders)
    assert_equal "Reminders for " + @user.full_name, mail.subject
    assert_equal ["jherrera@comcast.net"], mail.to
    assert_equal ["remindersupdate@justareminder.com"], mail.from
  end
  
  test "send_open_issues_delivers" do
    ReminderMailer.send_open_reminders.deliver
    
    assert !ActionMailer::Base.deliveries.empty?
  end

end
