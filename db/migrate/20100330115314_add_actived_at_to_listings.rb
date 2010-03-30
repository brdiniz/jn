class AddActivedAtToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :actived_at, :date
  end

  def self.down
    remove_column :listings, :actived_at
  end
end
