class Job < ActiveRecord::Base
  belongs_to :company
  has_many :listings, :dependent => :destroy
  
  validates_presence_of :title, :description, :salary_info

  validates_length_of :title, :minimum => 10
  validates_length_of :title, :maximum => 50

  validates_length_of :salary_info, :minimum => 10
  validates_length_of :salary_info, :maximum => 50
  
  validates_length_of :description, :minimum => 50
  validates_length_of :description, :maximum => 900
  
  def name
    "#{self.id}"
  end
end
