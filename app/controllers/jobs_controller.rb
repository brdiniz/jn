class JobsController < AuthenticateController
  load_and_authorize_resource :nested => [:account]
  belongs_to :account
  
  def destroy
    destroy! do |format|
      format.html { redirect_to account_path(@account) }
    end
  end

end
