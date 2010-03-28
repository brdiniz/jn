class RenameAccountToCompanyInJobs < ActiveRecord::Migration
  def self.up
    rename_column :jobs, :account_id, :company_id 
  end

  def self.down
    rename_column :jobs, :company_id, :account_id
  end
end
