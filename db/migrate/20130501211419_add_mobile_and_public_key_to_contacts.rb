class AddMobileAndPublicKeyToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :public_key, :string
    add_column :contacts, :mobile, :string, :limit => 30
  end
end
