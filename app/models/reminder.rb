class Reminder < ActiveRecord::Base
  attr_accessible :description, :end, :start, :user_id
  
  belongs_to :user
  
  has_and_belongs_to_many :contacts
  
  validates :description, :presence => true
  
  validates :end, :presence => true
  
  validates :start, :presence => true
  
  before_save :make_open
  
  def self.find_by_user_id(id, status)
    reminders = Reminder.where("user_id == ? AND Status = ?", id, status)
  end
  
  def close
    self.status = "Closed"
    self.save
  end
  
  private
  
  def make_open
    self.status = "Open"
  end
  
end
