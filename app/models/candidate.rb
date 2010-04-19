class Candidate < ActiveRecord::Base
  belongs_to :listing
  
  validates_presence_of :name, :email, :listing_id
end