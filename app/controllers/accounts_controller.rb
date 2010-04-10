class AccountsController < AuthenticateController
  load_and_authorize_resource

  def associate_professional
    @account = Account.find(params[:account_id])
    
    if request.put?
      @account.update_attributes(params[:account])
      if @account.associate_professional
        flash[:notice] = "Associação de Conta realizada com sucesso!"
        redirect_to(account_path(@account))
      end
    end
  end

  def disconnect_professional
    @account = Account.find(params[:account_id])
		@account.login_associate = params[:login_associate]
		if @account.disconnect_professional
			flash[:notice] = "Desassociação de Conta realizada com sucesso!"
			redirect_to(account_path(@account))
		else
			render :action => "show"
		end	
  end

  def create
    @account = params[:account][:kind].constantize.new(params[:account]) if !params[:account][:kind].blank?
    @account = Account.new(params[:account]) if params[:account][:kind].blank?

    if @account.save
      flash[:notice] = 'Criação de Conta realizada com sucesso!'
      redirect_to(account_path(@account))
    else
      render :action => "new" 
    end
  end
end
