class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :job_id
      t.string :email
      t.integer :day_count

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
