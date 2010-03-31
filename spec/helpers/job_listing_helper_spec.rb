require 'spec_helper'

describe JobListingHelper do
  include JobListingHelper
  
  it "should create list job listing" do
    l1 = Factory(:listing)
    l2 = Factory(:listing)
    l3 = Factory(:listing)
    l4 = Factory(:listing)
    l5 = Factory(:listing)
    
    l2.disable_listing
    l5.disable_listing
    
    generate_job_listing

    job_listings = Listing.job_listings
    
    job_listings.size.should == JobListing.all.size
    
    job_listings.should include l1
    job_listings.should_not include l2
    job_listings.should include l3
    job_listings.should include l4
    job_listings.should_not include l5
    
  end
  
end