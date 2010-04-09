class RenamePasswordToAccounts < ActiveRecord::Migration
  def self.up
    rename_column :accounts, :password, :encrypted_password
  end

  def self.down
    rename_column :accounts, :encrypted_password, :password
  end
end
