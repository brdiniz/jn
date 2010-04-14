require 'spec_helper'

describe Job do
  
  it "should create a new instance given valid attributes" do
    j = Factory.build(:job)
    j.should be_valid
    j.name.should == j.id.to_s
  end
  
end