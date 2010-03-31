require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JobsController do
  
  it "should redirect to account if destroy success" do
    job = Factory(:job)
    delete :destroy, :id => job.id, :account_id => job.company.id
    response.should redirect_to(account_path(job.company))
  end
  
end