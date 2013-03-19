require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test "contact find by id returns 2 records" do
    
    @contacts = Contact.find_by_user_id(1)
    
    assert_equal 2, @contacts.count
    
  end
end
