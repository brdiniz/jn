class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.belongs_to :account
      t.string :ip_adress
      t.string :path

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
