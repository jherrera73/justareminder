# == Schema Information
#
# Table name: reminders
#
#  id           :integer          not null, primary key
#  description  :string(255)
#  start        :datetime
#  end          :datetime
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :string(255)
#  location     :string(255)
#  location_url :string(255)
#

class Reminder < ActiveRecord::Base
  attr_accessible :description, :end, :start, :user_id, :status, :location, :location_url, :contact_ids
  
  belongs_to :user
  
  has_many :contactsreminders
  has_many :contacts, through: :contactsreminders
  
  validates :description, :presence => true
  
  validates :end, :presence => true
  
  validates :start, :presence => true
  
  before_create :make_open
  
  def self.find_by_user_id(id)
    reminders = Reminder.where("user_id = ? AND start >= ?", id, Time.zone.now).order("start ASC")
  end
  
  def self.find_all_by_user_id(id)
    reminders = Reminder.where("user_id = ?", id).order("start ASC")
  end
  
  scope :opened, lambda { where(:start => (Time.zone.now)..(Time.zone.now.midnight + 2.day)) }
    
  private
  
  def make_open
    self.status = "Open"
  end
  
end
