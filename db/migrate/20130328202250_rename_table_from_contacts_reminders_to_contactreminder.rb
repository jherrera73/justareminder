class RenameTableFromContactsRemindersToContactreminder < ActiveRecord::Migration
  def change
    rename_table :contacts_reminders, :contactsreminders
  end 
end
