class RemoveEmailToJobs < ActiveRecord::Migration
  def self.up
		remove_column :jobs, :email
  end

  def self.down
  end
end
