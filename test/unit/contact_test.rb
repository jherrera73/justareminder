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
end
