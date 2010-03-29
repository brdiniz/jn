class Account < ActiveRecord::Base
  KINDS = {"Empresa" => "Company", "Profissional" => "Professional" }
   
  attr_accessor :kind
  attr_accessor :login_associate
  attr_accessor :email_main_associate

  def <=>(other)
    self.name <=> other.name
  end
	
	def associate_professional
     self.professionals << Professional.find_by_login(self.login_associate)
  end

  def disconnect_professional
    p = Professional.find_by_login(self.login_associate)
		self.professionals.delete(p)
	  return true
  end
end
