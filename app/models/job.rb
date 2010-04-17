class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :category
  
  has_many :listings, :dependent => :destroy
  
  attr_accessor :category_name
  
  validates_presence_of :title, :description, :salary_info, :category_name

  validates_length_of :title, :minimum => 10
  validates_length_of :title, :maximum => 50

  validates_length_of :salary_info, :minimum => 10
  validates_length_of :salary_info, :maximum => 50
  
  validates_length_of :description, :minimum => 50
  validates_length_of :description, :maximum => 900
  
  before_save :associate_category
  
  def name
    "#{self.id}"
  end
  
  def associate_category
    c = Category.find_by_name(category_name)
    errors.add(:category_name) unless c
    self.category = c
  end
end
