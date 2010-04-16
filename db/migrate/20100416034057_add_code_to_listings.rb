class AddCodeToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :code, :string
  end

  def self.down
    remove_column :listings, :code
  end
end
