class AddOpeningToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :opening, :integer
  end

  def self.down
    remove_column :jobs, :opening
  end
end
