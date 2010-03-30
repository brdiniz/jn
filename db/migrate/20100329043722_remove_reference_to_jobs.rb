class RemoveReferenceToJobs < ActiveRecord::Migration
  def self.up
		remove_column :jobs, :ref_info
  end

  def self.down
  end
end
