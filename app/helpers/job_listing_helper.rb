module JobListingHelper
  def generate_job_listing
    JobListing.destroy_all
    
    Listing.all.each do |l|
      JobListing.create!(:listing_id => l.id) if l.active
    end
    
  end
end