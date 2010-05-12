class Candidate < ActiveRecord::Base
  belongs_to :listing
  
  validates_presence_of :name, :email, :listing_id
  after_create :send_emails
  
  def send_emails
    Emails.deliver_mailer_to_candidate(self, listing)
    Emails.deliver_mailer_to_company(self, listing)
  end
end