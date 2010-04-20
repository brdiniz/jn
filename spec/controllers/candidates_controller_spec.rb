require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CandidatesController do
  
  it "should listing when inform id listing" do
    l = Factory(:listing)
    get :new, :listing_id => l.id
    assigns[:listing].should == l
  end
end