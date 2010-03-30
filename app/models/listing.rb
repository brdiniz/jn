class Listing < ActiveRecord::Base
  belongs_to :job
  before_create :active_listing 
	validates_numericality_of :day_count, :less_than_or_equal_to => 30, :greater_than_or_equal_to => 10
  
  def active
    d = self.actived_at.to_date - Time.now.to_date
    self.day_count + d >= 0
  end
  
  def active_listing
    self.actived_at = Time.now.to_date
  end
end
