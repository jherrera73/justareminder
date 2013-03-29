class AddRemoveStartEndFromReminders < ActiveRecord::Migration
  def change
    remove_column :reminders, :start
    remove_column :reminders, :end
    
    add_column :reminders, :start, :datetime
    add_column :reminders, :end, :datetime
  end
end
