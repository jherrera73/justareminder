# == Schema Information
#
# Table name: reminders
#
#  id           :integer          not null, primary key
#  description  :string(255)
#  start        :datetime
#  end          :datetime
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :string(255)
#  location     :string(255)
#  location_url :string(255)
#

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
