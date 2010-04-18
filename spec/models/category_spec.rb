require 'spec_helper'

describe Category do
  
  it "should create a new instance given valid attributes" do
    c = Factory.build(:category)
    c.save
    c.should be_valid
  end
  
  it "should not create a new instance given invalid attributes" do
    l = Category.new
    l.should_not be_valid
    l.errors.on(:name).should_not be_blank
  end
  
  it "should not create a new instance when name exiting" do
    c1 = Factory(:category)
    c = Factory.build(:category, :name => c1.name)
    
    c.should_not be_valid
    c.errors.on(:name).should_not be_blank
  end
end