class Account < ActiveRecord::Base
  KINDS = {"Empresa" => "Company", "Profissional" => "Professional" }
   
  attr_accessor :kind
  attr_accessor :login_associate
  attr_accessor :email_main_associate
  
  validates_uniqueness_of :email_main, :login

  def <=>(other)
    self.name <=> other.name
  end

	def list_emails
		emails = []
    emails << self.email_main
    self.professionals.each do |professional|
      emails << professional.email_main
    end
		emails
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
