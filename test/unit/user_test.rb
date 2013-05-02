# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  full_name         :string(100)
#  email             :string(100)
#  role              :string(20)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  time_zone         :string(255)
#  mobile            :string(255)
#  public_key        :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user public_key should return one user for find_by_public_key" do
    @user = User.find_by_public_key(users(:one).public_key)
    assert_not_nil @user
  end
  
  test "valid user with mobile number will send message " do
    @user = users(:one)
    assert @user.send_message
  end
  
  test "valid user without mobile number will not send message " do
    @user = users(:two)
    assert_equal false, @user.send_message
  end
end
