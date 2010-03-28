class AccountsController < InheritedResources::Base
  def associate_professional
    @account = Account.find(params[:account_id])
    
    if request.put?
      @account.update_attributes(params[:account])
      if @account.associate_professional
        flash[:notice] = "Associação de Usuário realizada com sucesso!"
        redirect_to(account_path(@account))
      end
    end
  end

  def disconnect_professional
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
