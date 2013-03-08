class Reminder < ActiveRecord::Base
  attr_accessible :description, :end, :start
  
  belongs_to :user
  
  has_and_belongs_to_many :contacts
end
