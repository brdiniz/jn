class RemoveOpeningToJobs < ActiveRecord::Migration
  def self.up
    remove_column :jobs, :opening
    add_column :listings, :opening, :integer
  end

  def self.down
    remove_column :listings, :opening
    add_column :jobs, :opening, :integer
  end
end
