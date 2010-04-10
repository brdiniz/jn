class ListingsController < AuthenticateController
  belongs_to :account
  belongs_to :job

  def destroy
    destroy! do |format|
      format.html { redirect_to account_job_path(@account, @job) }
    end
  end
  
  def enable_listing
    if request.put?
      @account = Account.find(params[:account_id])
      @job = Job.find(params[:job_id])
      Listing.find(params[:listing_id]).enable_listing
      flash[:notice] = "Anuncio ativado com sucesso!"
      redirect_to(account_job_path(@account, @job))
    end
  end
  
  def disable_listing
    if request.put?
      @account = Account.find(params[:account_id])
      @job = Job.find(params[:job_id])
      Listing.find(params[:listing_id]).disable_listing
      flash[:notice] = "Anuncio desativado com sucesso!"
      redirect_to(account_job_path(@account, @job))
    end
  end
end
