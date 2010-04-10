class Session < ActiveRecord::Base
  belongs_to :account
  
  attr_accessor :login, :password
end
