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

  it "should order by name" do
    categories = []
    categories << Factory(:category, :name => "a")
    categories << Factory(:category, :name => "d")
    categories << Factory(:category, :name => "b")
    categories << Factory(:category, :name => "e")

    categories.sort!
    categories.delete_at(0).name.should == "a"
    categories.delete_at(0).name.should == "b"
    categories.delete_at(0).name.should == "d"
    categories.delete_at(0).name.should == "e"
  end
end