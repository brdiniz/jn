class JobsController < InheritedResources::Base
  belongs_to :account
  
  def destroy
    destroy! do |format|
      format.html { redirect_to account_path(@account) }
    end
  end

end
