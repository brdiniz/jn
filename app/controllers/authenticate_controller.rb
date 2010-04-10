class AuthenticateController < InheritedResources::Base
  load_and_authorize_resource
  
  before_filter :maintain_session_and_user

  def current_session
    session[:id]
  end
  
  def current_user
    session[:current_user]
  end
  
  private
  def maintain_session_and_user
    @session = Session.find_by_id(current_session)
    logout unless @session
    @application_account = @session.account
  end
  
  def logout
    @session = Session.find_by_id(current_session)
    @session.destroy if @session
    session[:id] = nil
    redirect_to(new_session_path)
  end
end