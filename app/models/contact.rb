class Contact < ActiveRecord::Base
  attr_accessible :full_name, :email, :user_id
  
  has_and_belongs_to_many :reminders
  
  validates :full_name, :presence => true
  
  validates :email, :presence => true
  
  def self.find_by_user_id(id)
    contacts = Contact.where("user_id == ?", id)
  end
  
end
