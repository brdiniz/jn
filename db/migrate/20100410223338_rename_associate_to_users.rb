class RenameAssociateToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :user_id, :person_id
    rename_column :users, :user_type, :person_type
  end

  def self.down
    rename_column :users, :person_id, :user_id
    rename_column :users, :person_type, :user_type
  end
end
