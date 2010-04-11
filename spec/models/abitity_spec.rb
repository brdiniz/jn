require 'spec_helper'

describe Ability do
  
  it "should manage jobs when professional is an associate in company" do
    p = Factory(:professional)
    p1 = Factory(:professional)
    j = Factory(:job)
    j.company.professionals << p
    
    Ability.new(p.user.login).can?(:manage_jobs, j).should be(true)
    Ability.new(p1.user.login).can?(:manage_jobs, j).should be(false)
  end
  
  it "should show company when professional is an associate in company" do
    p = Factory(:professional)
    p1 = Factory(:professional)
    l = Factory(:listing)
    l.job.company.professionals << p
    
    Ability.new(p.user.login).can?(:manage_listings, l).should be(true)
    Ability.new(p1.user.login).can?(:manage_listings, l).should be(false)
  end
  
  it "should manage my company" do
    c = Factory(:company)
    c1 = Factory(:company)
    
    Ability.new(c.user.login).can?(:my_account, c).should be(true)
    Ability.new(c.user.login).can?(:my_account, c1).should be(false)
  end
  
end