class ContactsReminders < ActiveRecord::Migration
  def change
    create_table :contacts_reminders do |t|
      t.integer :contact_id
      t.integer :reminder_id


      t.timestamps
    end
  end
end
