# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  full_name  :string(255)
#  email      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  public_key :string(255)
#  mobile     :string(30)
#

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  
  test "contact find by id returns 2 records" do  
    @contacts = Contact.find_by_user_id(1)
    assert_equal 2, @contacts.count
  end
  
  test "valid contact public_key should return one user for find_by_public_key" do
    @contact = Contact.find_by_public_key(contacts(:one).public_key)
    assert_not_nil @contact
  end
  
  test "valid contact with mobile number will send message " do
    @contact = contacts(:one)
    assert @contact.send_message
  end
  
  test "valid contact without mobile number will not send message " do
    @contact = contacts(:two)
    assert_equal false, @contact.send_message
  end
  
end
