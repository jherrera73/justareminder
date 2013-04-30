class AddLocationAndLocationUrlToReminders < ActiveRecord::Migration
  def change
     add_column :reminders, :location, :string
     add_column :reminders, :location_url, :string
  end
end
