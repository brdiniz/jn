class CreateJobListings < ActiveRecord::Migration
  def self.up
    create_table :job_listings do |t|
      t.integer :listing_id

      t.timestamps
    end
  end

  def self.down
    drop_table :job_listings
  end
end
