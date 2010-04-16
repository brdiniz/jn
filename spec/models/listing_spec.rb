require 'spec_helper'

describe Listing do
  
  it "should not create a new instance given invalid attributes" do
    l = Listing.new
    l.should_not be_valid
    l.errors.on(:opening).should_not be_blank
    l.errors.on(:job).should_not be_blank
    l.errors.on(:region).should_not be_blank
    l.errors.on(:location).should_not be_blank
    l.errors.on(:day_count).should_not be_blank
    l.errors.on(:email).should_not be_blank
  end
  
  it "should create a new instance given valid attributes" do
    l = Factory(:listing)
    l.expirate_date.should == l.actived_at.to_date + l.day_count.days 
    l.code.should_not be_blank
  end
  
  it "should create a new instance inform the code" do
    l = Factory(:listing, :code => "abc123")
    l.should be_valid
    l.code.should == "abc123"
  end
  
  it "should verify listing active" do
    l = Factory(:listing, :day_count => 10)
    l.active.should be_true
    
    l.actived_at = l.actived_at.to_date - 10.days
    l.active.should be_true
    
    l.actived_at = l.actived_at.to_date - 1.days
    l.active.should be_false
  end
  
  it "should enable and disable listing" do
    l = Factory(:listing, :day_count => 30)
    Listing.find(l.id).disable_listing
    Listing.find(l.id).active.should_not be_true
    Listing.find(l.id).day_count.should == -1
    Listing.find(l.id).enable_listing
    Listing.find(l.id).active.should be_true
    Listing.find(l.id).day_count.should == 10
  end
end