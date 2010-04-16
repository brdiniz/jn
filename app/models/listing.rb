class Listing < ActiveRecord::Base
  belongs_to :job
  has_many :job_listing

  before_create :active_listing
	before_save :generate_code
                                  
  named_scope :published, {:conditions => ["ADDDATE(actived_at, day_count) > ?", Time.now.to_date + 1.days], :order => ["actived_at DESC"] }
   
 	validates_numericality_of :opening, :less_than_or_equal_to => 109, :greater_than_or_equal_to => 1
	validates_numericality_of :day_count, :less_than_or_equal_to => 30, :greater_than_or_equal_to => 10, :on => :create
	validates_presence_of :job, :location, :region, :email
  validates_uniqueness_of :code, :scope => :job_id
  
  def active
    d = self.actived_at.to_date - Time.now.to_date
    self.day_count + d >= 0
  end
  
  def active_listing
    self.actived_at = Time.now.to_date
  end
  
  def disable_listing
    self.day_count = -1
    self.save!
  end
  
  def enable_listing
    active_listing
    self.day_count = 10
    self.save!
  end
  
  def expirate_date
    self.actived_at.to_date + self.day_count.days 
  end
  
  private  
  def generate_code
    return if !code.to_s.blank?
    self.code = Base64.encode64(Digest::SHA1.digest("#{rand(1<<64)}/#{Time.now.to_s}/#{Process.pid}/#{self.job.company.name}"))[0..5].upcase
  end
end
