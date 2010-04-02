require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JobListingsController do

  it "should updated job listing" do
    l1 = Factory(:listing)
    l2 = Factory(:listing)
    l3 = Factory(:listing)
    l2.disable_listing

    put :updated_listing
    response.should redirect_to(jobs_path)

    Listing.job_listings.size.should == 2
  end

  it "should list job listing" do
    l1 = Factory(:listing)
    l2 = Factory(:listing)
    l3 = Factory(:listing)
    l2.disable_listing

    get :index
    assigns[:job_listings].should == Listing.job_listings
  end

end

