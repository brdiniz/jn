require 'spec_helper'

describe Account do
  
  it "should create a new instance given valid attributes" do
    Factory(:company)
  end
  
  it "should not create a new instance when email main exiting" do
    Factory(:company, :email_main => "jn@jn.com")
    a = Factory.build(:professional, :email_main => "jn@jn.com")
    
    a.should_not be_valid
    a.errors.on(:email_main).should_not be_blank
  end
  
  it "should destroy an user when remove account" do
    c = Factory(:company)
    u = c.user
    
    u.should_not be_blank
    c.destroy
    User.find_by_login(u.login).should be_blank
  end
  
  it "should not create a new instance when login exiting" do
    Factory(:company, :user => Factory(:user, :login => "jn"))
    a = Factory.build(:user, :login => "jn")
    
    a.should_not be_valid
    a.errors.on(:login).should_not be_blank
  end
  
  it "should associate and list all emails in the company and professionals" do
    password = "abc123"
    
    c1 =  Factory.build(:company, :user => Factory(:user, :password => password, :password_confirmation => password))
    c1.save
    puts c1.errors.full_messages
    
    c = Factory(:company, :email_main => "email@company.com", :user => Factory(:user, :password => password, :password_confirmation => password))
    c.user.encrypted_password.should == c1.user.encrypted_password
    
    p = Factory(:professional, :email_main => "email@professional.com")
    c.login_associate = p.user.login
    c.email_main_associate = p.email_main
    
    c.associate_professional
    c.professionals.should include p
    c.list_emails.should include p.email_main
    c.list_emails.should include c.email_main
    
    c.disconnect_professional
    c.professionals.should_not include p
    c.list_emails.should include c.email_main
    c.list_emails.should_not include p.email_main
  end
  
  it "should order by name" do
    accounts = []
    accounts << Factory(:company, :name => "a")
    accounts << Factory(:company, :name => "d")
    accounts << Factory(:professional, :name => "b")
    accounts << Factory(:professional, :name => "e")

    accounts.sort!
    accounts.delete_at(0).name.should == "a"
    accounts.delete_at(0).name.should == "b"
    accounts.delete_at(0).name.should == "d"
    accounts.delete_at(0).name.should == "e"
  end
end