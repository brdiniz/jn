require 'digest/sha2'

class User < ActiveRecord::Base
  ENCRYPT = Digest::SHA256
  
  attr_reader :password
  attr_accessor :password_confirmation

  validates_presence_of :login
  
  belongs_to :person, :polymorphic => true

  after_save :flush_passwords
  
  def password=(password)
    @password = password
    unless password_is_not_being_updated?
      self.encrypted_password = ENCRYPT.hexdigest(password)
    end
  end

  def password_is_not_being_updated?
   self.id and self.password.blank?
  end
  
  def self.find_by_login_and_password(login, password)
    account = self.find_by_login(login)
    if account and account.encrypted_password == ENCRYPT.hexdigest(password)
      return account
    end
  end

  def flush_passwords
    self.password = self.password_confirmation = nil
  end
end
