class Job < ActiveRecord::Base
  belongs_to :company
  has_many :listings, :dependent => :destroy
  
	validates_numericality_of :opening, :less_than_or_equal_to => 99, :greater_than_or_equal_to => 1

  def name
    "#{self.id}"
  end
end
