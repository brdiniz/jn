class UsersController < AuthenticateController
  load_and_authorize_resource
  
  def password
    @user = User.find_by_login(session[:current_user])
  end
end