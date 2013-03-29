class AddRemoveStartEndFromReminders < ActiveRecord::Migration
  def change
    drop_column :reminders, :start, :time
    drop_column :reminders, :end, :time
    
    add_column :persons, :start, :datetime
    add_column :persons, :end, :datetime
  end
end
