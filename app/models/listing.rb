class Listing < ActiveRecord::Base
  belongs_to :job
  
  def active
    d = self.created_at.to_date - Time.now.to_date
    self.day_count + d >= 0
  end
end
