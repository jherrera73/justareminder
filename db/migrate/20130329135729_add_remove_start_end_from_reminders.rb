class AddRemoveStartEndFromReminders < ActiveRecord::Migration
  def change
    remove_column :reminders, :start, :time
    remove_column :reminders, :end, :time
    
    add_column :persons, :start, :datetime
    add_column :persons, :end, :datetime
  end
end
