require 'spec_helper'

describe Candidate do
  
  it "should not create a new instance given invalid attributes" do
    c = Candidate.new
    c.should_not be_valid
    c.errors.on(:listing_id).should_not be_blank
    c.errors.on(:name).should_not be_blank
    c.errors.on(:email).should_not be_blank
  end
  
end