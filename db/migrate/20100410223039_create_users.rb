class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :encrypted_password
      t.integer :user_id, :references => nil
      t.string :user_type

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
