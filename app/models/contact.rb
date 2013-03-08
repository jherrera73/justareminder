class Contact < ActiveRecord::Base
  attr_accessible :full_name, :email
  
  has_and_belongs_to_many :reminders
end
