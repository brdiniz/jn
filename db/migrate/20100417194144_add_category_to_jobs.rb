class AddCategoryToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :category_id, :int
  end

  def self.down
    remove_column :jobs, :category_id
  end
end
