class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, :limit => 100
      t.string :email, :limit => 100
      t.string :role, :limit => 20
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.timestamps
    end
  end
end
