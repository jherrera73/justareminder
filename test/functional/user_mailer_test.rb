require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  
  setup do
    @user = users(:one)
  end
  
  test "register_confirmation" do
    mail = UserMailer.register_confirmation(@user)
    assert_equal "Register confirmation", mail.subject
    assert_equal ["jherrera@comcast.net"], mail.to
    assert_equal ["registration@justareminder.com"], mail.from
  end

end
