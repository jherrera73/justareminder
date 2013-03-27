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
#

class Contact < ActiveRecord::Base
  attr_accessible :full_name, :email, :user_id
  
  has_and_belongs_to_many :reminders
  
  validates :full_name, :presence => true
  
  validates :email, :presence => true
  
  def self.find_by_user_id(id)
    contacts = Contact.where("user_id == ?", id)
  end
  
end
