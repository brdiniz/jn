class SessionsController < InheritedResources::Base
  
  def create
    @session = Session.new(params[:session])
    if @session.save
      session[:id] = @session.id
      session[:current_user] = @session.account.user.login
      flash[:notice] = "Sessão para #{@session.account.name} criada com sucesso!"
      redirect_to(accounts_path) if @session.account.user.admin?
      redirect_to(account_path(@session.account)) if !@session.account.user.admin?
    else
      flash[:error] = "Usuário e senha inválidos"
      current_session = nil
      render(:action => 'new')
    end
  end
  
  def destroy
    @session = Session.find_by_id(session[:id])
    @session.destroy if @session
    session[:id] = nil
    redirect_to(new_session_path)
  end
end