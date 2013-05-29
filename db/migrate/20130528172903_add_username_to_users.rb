class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username,                :unique => true
    remove_index :users, :email
  end
end
