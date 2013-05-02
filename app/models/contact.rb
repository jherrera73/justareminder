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

class Contact < ActiveRecord::Base
  attr_accessible :full_name, :email, :user_id, :mobile
  
  has_many     :contactsreminders
  has_many     :reminders, through: :contactsreminders
  
  validates    :full_name, :presence => true
  
  validates    :email, :presence => true
  
  before_save  :add_public_key
  
  def self.find_by_user_id(id)
    contacts = Contact.where("user_id == ?", id)
  end
  
  def self.find_by_public_key(id)
    contact = Contact.where("public_key = ?", id)
  end
  
  def send_message
    return false if self.mobile.blank?
    message = Message.new
    message.send_text(self.mobile, self.public_key)
    return true
  end
  
  private
  
  def add_public_key
    self.public_key = SecureRandom.uuid if self.public_key.blank?
  end
end
