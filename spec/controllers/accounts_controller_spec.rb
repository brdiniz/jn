require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountsController do
  it_should_behave_like "authenticated controller"
  
  it "should redirect to account when associate professional" do
    a = Factory(:company)
    p = Factory(:professional)
    put :associate_professional, :account_id => a.id, :account => {:login_associate => p.user.login}
    response.should redirect_to(account_path(a))
    Account.find(a.id).professionals.should include p
  end
  
  it "should redirect to account when disassociate professional" do
    a = Factory(:company)
    p = Factory(:professional)
    
    a.professionals << p
    
    put :disconnect_professional, :account_id => a.id, :login_associate => p.user.login
    response.should redirect_to(account_path(a))
    
    Account.find(a.id).professionals.should_not include p
  end
  
  it "should not redirect to account when disassociate professional" do
    a = Factory(:company)
    
    put :disconnect_professional, :account_id => a.id, :login_associate => "1.1"
    response.should render_template('show')
  end
  
  it "should redirect account when create" do
    mock = Factory(:company)
    mock.expects(:save).returns(true)
    Account.stubs(:new).with({'these' => 'params'}).returns(mock)
    post :create, :account => {:these => 'params'}
    assigns[:account].should == mock
    response.should redirect_to(account_url(mock))
  end
  
  it "should not redirect account invalid create" do
    Factory(:company, :user => Factory(:user,  :login => "jn"))
    a = Factory.build(:company)
    post :create, :account => { :kind => a.kind, :name => a.name, :email_main => a.email_main }, :user => {:login => "jn", :password => "abc123"}
    response.should render_template('new')
  end
  
end