# == Schema Information
#
# Table name: contactsreminders
#
#  id          :integer          not null, primary key
#  contact_id  :integer
#  reminder_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Contactsreminder < ActiveRecord::Base
  attr_accessible :contact_id, :reminder_id
  
  belongs_to :contact
  belongs_to :reminder
end
