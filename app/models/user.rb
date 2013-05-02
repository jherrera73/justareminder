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

class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :email, :full_name, :password, 
                  :password_confirmation, :role, :time_zone, :mobile,
                  :public_key
  
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)

  before_save     :ensure_in_role
  before_save     :add_public_key
  
  has_many :contacts
  
  has_many :reminders, :order => 'start ASC'
  
  ROLES = %w[Admin User]

  def admin?
    self.role == "Admin"
  end
  
  def self.find_by_public_key(id)
    user = User.where("public_key = ?", id).first
  end
  
  def send_message
    return false if self.mobile.blank?
    message = Message.new
    message.send_text(self.mobile, self.public_key)
    return true
  end

  private

  def ensure_in_role
    self.role = "User" if self.role.blank?
  end
  
  def add_public_key
    self.public_key = SecureRandom.uuid if self.public_key.blank?
  end
  
end
