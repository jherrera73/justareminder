# == Schema Information
#
# Table name: reminders
#
#  id          :integer          not null, primary key
#  description :string(255)
#  start       :time
#  end         :time
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :string(255)
#

class Reminder < ActiveRecord::Base
  attr_accessible :description, :end, :start, :user_id, :status
  
  belongs_to :user
  
  has_and_belongs_to_many :contacts
  
  validates :description, :presence => true
  
  validates :end, :presence => true
  
  validates :start, :presence => true
  
  before_create :make_open
  
  def self.find_by_user_id(id, status)
    reminders = Reminder.where("user_id == ? AND Status = ?", id, status)
  end
  
  scope :open, lambda { where(:start => (Time.zone.now.midnight - 1.day)..(Time.zone.now.midnight + 1.day)) }
  
  def close
    self.status = "Closed"
    self.save
  end
  
  private
  
  def make_open
    self.status = "Open"
  end
  
end
