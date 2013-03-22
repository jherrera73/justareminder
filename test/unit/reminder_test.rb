require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  
  setup do
    @reminder_one = reminders(:one)
  end
  
  test "reminder find by id returns 2 records" do
    
    @reminders = Reminder.find_by_user_id(1, "Open")
    
    assert_equal 2, @reminders.count
    
  end
  
end
