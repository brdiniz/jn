class Job < ActiveRecord::Base
  belongs_to :company
  has_many :listings, :dependent => :destroy

  def name
    "#{self.id}"
  end
end
