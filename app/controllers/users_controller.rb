require 'digest/sha2'

class UsersController < AuthenticateController
  before_filter :verify_user
  load_and_authorize_resource
  
  def password
    if request.put?
      if @user.encrypted_password != Digest::SHA256.hexdigest(params[:user][:password_old].to_s)
        flash[:error] = "Senha atual inválida"
      else
        @user.update_attributes(params[:user])
        if @user.save
          flash[:notice] = "Alteração de senha realizada com sucesso!"
          redirect_to(account_path(@session.account))
        end
      end
    end
  end
  
  def verify_user
    @user = User.find_by_login(session[:current_user])
  end
end