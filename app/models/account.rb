require 'digest/sha2'

class Account < ActiveRecord::Base
  KINDS = {"Empresa" => "Company", "Profissional" => "Professional" }

  ENCRYPT = Digest::SHA256
  
  attr_reader :password
  
  attr_accessor :password_confirmation   
  attr_accessor :kind
  attr_accessor :login_associate
  attr_accessor :email_main_associate
  
  validates_uniqueness_of :email_main, :login

  after_save :flush_passwords

  def <=>(other)
    self.name <=> other.name
  end
  
  def password=(password)
    @password = password
    unless password_is_not_being_updated?
      self.encrypted_password = ENCRYPT.hexdigest(password)
    end
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

  def password_is_not_being_updated?
   self.id and self.password.blank?
  end

  def disconnect_professional
    p = Professional.find_by_login(self.login_associate)
    return false unless p
		self.professionals.delete(p)
	  return true
  end

  def flush_passwords
    @password = @password_confirmation = nil
  end
end
