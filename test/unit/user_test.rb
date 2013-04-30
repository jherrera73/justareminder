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
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
