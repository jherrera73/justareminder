class ChangeDateFormatInReminders < ActiveRecord::Migration
  def up
    change_column :reminders, :start, :time
    change_column :reminders, :end, :time
  end

  def down
    change_column :reminders, :start, :datetime
    change_column :reminders, :end, :datetime
  end
end
