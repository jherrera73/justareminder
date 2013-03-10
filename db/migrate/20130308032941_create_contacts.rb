class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end