class JobsController < InheritedResources::Base
  belongs_to :account
  
  def index
    @account = Account.find(params[:account_id]) if params[:account_id]
    @account = Account.find(16) if @account.nil?
    @jobs = @account.jobs
  end
end
