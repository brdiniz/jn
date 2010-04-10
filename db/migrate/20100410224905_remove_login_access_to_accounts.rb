class RemoveLoginAccessToAccounts < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :login
    remove_column :accounts, :encrypted_password
  end

  def self.down
    add_column :accounts, :login, :string
    add_column :accounts, :encrypted_password, :string
  end
end
