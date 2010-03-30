class JobsController < InheritedResources::Base
  belongs_to :account
  
  def index
    @jobs = Job.all
  end

  
  def destroy
    destroy! do |format|
      format.html { redirect_to account_path(@account) }
    end
  rescue Exception => e
    flash[:error] = e.message
    redirect_to(account_job_path)
  end

end
