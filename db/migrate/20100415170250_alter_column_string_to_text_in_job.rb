class AlterColumnStringToTextInJob < ActiveRecord::Migration
  def self.up
    remove_column :jobs, :description
    add_column :jobs, :description, :text
    remove_column :jobs, :title
    add_column :jobs, :title, :text
  end

  def self.down
    remove_column :jobs, :description
    add_column :jobs, :description, :string
    remove_column :jobs, :title
    add_column :jobs, :title, :string
  end
end
