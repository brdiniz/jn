class JobListing < ActiveRecord::Base
  belongs_to :listing
  validates_presence_of :listing_id
end
