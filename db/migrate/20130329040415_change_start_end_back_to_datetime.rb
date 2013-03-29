class ChangeStartEndBackToDatetime < ActiveRecord::Migration
  def change
    change_column :reminders, :start, :datetime
    change_column :reminders, :end, :datetime
  end
end
