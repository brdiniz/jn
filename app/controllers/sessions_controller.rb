class SessionsController < InheritedResources::Base
  
  def create
    @session = Session.new(params[:session])
    if @session.save
      session[:id] = @session.id
      redirect_to(accounts_path) if @session.account.admin?
      redirect_to(users_path) if !@session.account.admin?
    else
      current_session = nil
      render(:action => 'new')
    end
  end
  
  def destroy
    @session = Session.find(session[:id])
    @session.destroy
    session[:id] = nil
    redirect_to(new_session_path)
  end
end