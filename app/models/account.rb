class Account < ActiveRecord::Base
  KINDS = {"Empresa" => "Company", "Profissional" => "Professional" }
   
  attr_accessor :kind
  attr_accessor :login_associate
  attr_accessor :email_main_associate

  def <=>(other)
    self.name <=> other.name
  end
end