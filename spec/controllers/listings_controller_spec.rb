require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListingsController do
  
  it "should redirect to job when enable account" do
    l = Factory(:listing)
    l.day_count = -1
    l.active.should_not be_true
    
    put :enable_listing, :listing_id => l.id, :job_id => l.job.id, :account_id => l.job.company.id
    
    Listing.find(l).active.should be_true
  end
  
  it "should redirect to job when disable account" do
    l = Factory(:listing)
    l.active.should be_true
    
    put :disable_listing, :listing_id => l.id, :job_id => l.job.id, :account_id => l.job.company.id
    
    Listing.find(l).active.should_not be_true
  end
  
  it "should redirect to job when destroy listing" do
    l = Factory(:listing)
    delete :destroy, :id => l.id, :job_id => l.job.id, :account_id => l.job.company.id
    response.should redirect_to(account_job_path(l.job.company, l.job))
  end
  
end