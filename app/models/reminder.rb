class Reminder < ActiveRecord::Base
  attr_accessible :description, :end, :start, :user_id
  
  belongs_to :user
  
  has_and_belongs_to_many :contacts
  
  validates :description, :presence => true
  
  validates :end, :presence => true
  
  validates :start, :presence => true
  
  def self.find_by_user_id(id)
    reminders = Reminder.where("user_id == ?", id)
  end
end
