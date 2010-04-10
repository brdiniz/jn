class Account < ActiveRecord::Base
  KINDS = {"Empresa" => "Company", "Profissional" => "Professional" }

  has_one :user, :as => :person
  accepts_nested_attributes_for :user
  
  validates_presence_of :user
  validates_associated :user
  validates_uniqueness_of :email_main
  
  after_destroy :delete_user
    
  attr_accessor :kind
  attr_accessor :login_associate
  attr_accessor :email_main_associate
  
  
  def admin?
    return true if login == "brdiniz"
  end

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
    return false unless p
		self.professionals.delete(p)
	  return true
  end

  def delete_user
    user.destroy if user
  end
end
