require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PortalController do
  it_should_behave_like "authenticated controller"
  
  it "should listing published" do
    Factory(:listing)
    Factory(:listing)
    
    get :index
    assigns[:listings].should == Listing.published
  end
  
  it "should list listing in category" do
    l = Factory(:listing)
    
    get :category_listing, :category_id => l.job.category.id
    assigns[:listings].should == Listing.list_jobs_for_category(l.job.category)
  end
end