class AddRegionToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :region, :string
    add_column :listings, :location, :string
  end

  def self.down
    remove_column :listings, :location
    remove_column :listings, :region
  end
end
