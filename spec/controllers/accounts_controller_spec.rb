require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountsController do
  
  it "should redirect to account when associate professional" do
    a = Factory(:company)
    p = Factory(:professional)
    put :associate_professional, :account_id => a.id, :account => {:login_associate => p.login}
    response.should redirect_to(account_path(a))
    Account.find(a.id).professionals.should include p
  end
  
  it "should redirect to account when disassociate professional" do
    a = Factory(:company)
    p = Factory(:professional)
    
    a.professionals << p
    
    put :disconnect_professional, :account_id => a.id, :login_associate => p.login
    response.should redirect_to(account_path(a))
    
    Account.find(a.id).professionals.should_not include p
  end
  
  it "should not redirect to account when disassociate professional" do
    a = Factory(:company)
    p = Factory(:professional)
    
    put :disconnect_professional, :account_id => a.id, :login_associate => "1.1"

    response.should render_template('show')
  end
  
  it "should redirect account when create" do
    
    a = Factory.build(:company)
    post :create, :account => { :kind => a.kind, :name => a.name, :email_main => a.email_main, :login => a.login, :password => a.password }
    
    a = Account.find_by_login(a.login)
    response.should redirect_to(account_path(a))   
  end
  
  it "should not redirect account invalid create" do
    Factory(:company, :login => "jn")
    a = Factory.build(:company, :login => "jn")
    post :create, :account => { :kind => a.kind, :name => a.name, :email_main => a.email_main, :login => a.login, :password => a.password }
    
    response.should render_template('new')
  end
  
end