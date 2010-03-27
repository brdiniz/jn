class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :email_main
      t.string :login
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
