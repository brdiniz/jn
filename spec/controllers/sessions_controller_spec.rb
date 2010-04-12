require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SessionsController do
  
  it "should create session and redirect account when login and password correct" do
    c = Factory(:company)
    post :create, :session => { :login => c.user.login, :password => "ABC123"}
    response.should redirect_to(account_url(c))
  end
  
  it "should not create session when login and password invalid" do
    c = Factory(:company)
    post :create, :session => { :login => c.user.login, :password => "ZXV098"}
    response.should render_template('new')
  end
end