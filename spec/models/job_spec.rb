require 'spec_helper'

describe Job do
  
  it "should create a new instance given valid attributes" do
    j = Factory(:job)
    j.name.should == j.id.to_s
    j.category_name_value.should == j.category.name
  end

  it "should not create a new instance given invalid attributes" do
    j = Job.new
    j.should_not be_valid
    j.errors.on(:title).should_not be_blank
    j.errors.on(:description).should_not be_blank
    j.errors.on(:salary_info).should_not be_blank
    j.errors.on(:category_name).should_not be_blank
  end
end