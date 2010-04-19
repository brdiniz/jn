require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PortalController do
  it_should_behave_like "authenticated controller"
  
  it "should listing published" do
    Factory(:listing)
    Factory(:listing)
    
    get :index
    assigns[:listings].should == Listing.published
  end
  
  it "should details listing published" do
    l = Factory(:listing)
    
    get :show, :listing_id => l.id, :category_id => l.job.category.id
    assigns[:listing].should == l
    assigns[:category].should == l.job.category
  end
end