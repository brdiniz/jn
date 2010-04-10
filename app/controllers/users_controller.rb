class UsersController < AuthenticateController
  
  def index
    @account = @application_account
  end
end
