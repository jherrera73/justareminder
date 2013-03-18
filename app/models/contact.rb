class Contact < ActiveRecord::Base
  attr_accessible :full_name, :email, :user_id
  
  has_and_belongs_to_many :reminders
  
  validates :full_name, :presence => true
  
  validates :email, :presence => true
end
