class Job < ActiveRecord::Base
  belongs_to :company

  def name
    self.ref_info
  end
end
