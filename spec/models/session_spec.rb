require 'spec_helper'

describe Session do
  
  it "should have an account associated with the session when informed the login and password" do
    c = Factory(:company, :user => Factory(:user, :login => "teste_company",  :password => "abc123", :password_confirmation => "abc123"))
    s = Session.new(:login => "teste_company", :password => "abc123")
    s.save
    s.should be_valid
    s.account.should == c
  end
  
  it "should not have an account associate with the session when login and password invalid" do
    c = Factory(:company, :user => Factory(:user, :login => "teste_company",  :password => "value", :password_confirmation => "value"))
    s = Session.new(:login => "teste_company", :password => "abc123")
    s.save
    s.should_not be_valid
    s.account.should_not == c
  end
end