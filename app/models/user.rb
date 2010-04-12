require 'digest/sha2'

class User < ActiveRecord::Base
  belongs_to :person, :polymorphic => true

  ENCRYPT = Digest::SHA256
  
  attr_reader :password
  attr_accessor :password_confirmation
  validate :verify_password_and_confirmation
  validates_presence_of :login
  validates_uniqueness_of :login
  
  after_save :flush_passwords
  
  def admin?
    return true if login == "brdiniz"
  end
  
  def password=(password)
    @password = password
    unless password_is_not_being_updated?
      self.encrypted_password = ENCRYPT.hexdigest(password)
    end
  end
  
  def verify_password_and_confirmation
    errors.add(:password_confirmation, " diferente da senha informada") if password != password_confirmation
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
