class AuthenticateController < InheritedResources::Base
  
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
end