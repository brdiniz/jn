class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :site
      t.string :observation
      t.belongs_to :listing

      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
