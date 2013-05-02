require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "valid user modile and public send a text" do
    @user = users(:one)
    
    message = Message.new
    
    assert message.send_text(@user.mobile, @user.public_key)
  end
end