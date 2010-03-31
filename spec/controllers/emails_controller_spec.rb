require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EmailsController do
  
  it "should emails in Company associate" do
    c = Factory(:company, :email_main => "c@c.com" )
    p = Factory(:professional, :email_main => "d@d.com")
    c.professionals << p
    
    get :index, :format => "xml", :account_id => c.id
    response.body.should =~ /<email>.*<\/email>/m
    response.body.should =~ /<name>c@c.com<\/name>/m
    response.body.should =~ /<name>d@d.com<\/name>/m
  end
end