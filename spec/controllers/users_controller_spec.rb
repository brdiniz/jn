require 'digest/sha2'
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  it_should_behave_like "authenticated controller"
  
  it "should alter password when valid attributes" do
    p = User.first.person
    p.user.encrypted_password.should == Digest::SHA256.hexdigest("123ABC")
        
    put :password, :user => {:password_old => "123ABC", :password => "ABC", :password_confirmation => "ABC"}
    response.should redirect_to(account_path(p))
    Professional.find(p.id).user.encrypted_password.should == Digest::SHA256.hexdigest("ABC")
  end
  
  it "should not alter password when invalid password" do
    put :password, :user => {:password_old => "ABC123", :password => "ABC", :password_confirmation => "ABC"}
    response.should render_template('password')
    
    p = User.first.person
    Professional.find(p.id).user.encrypted_password.should == Digest::SHA256.hexdigest("123ABC")
  end
end