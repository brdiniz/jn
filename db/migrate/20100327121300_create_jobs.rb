class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :title
      t.string :salary_info
      t.string :description
      t.string :ref_info

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
