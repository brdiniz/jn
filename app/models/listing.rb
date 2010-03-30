class Listing < ActiveRecord::Base
  belongs_to :job
  before_create :active_listing 
	validates_numericality_of :day_count, :less_than_or_equal_to => 30
  
  def active
    d = self.actived_at.to_date - Time.now.to_date
    self.day_count + d >= 0
  end
  
  def active_listing
    self.actived_at = Time.now.to_date
  end
  
  def disable_listing
    self.day_count = -1
    self.save
  end
  
  def enable_listing
    active_listing
    self.day_count = 10
    self.save!
  end
end
