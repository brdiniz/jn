class CandidatesController < InheritedResources::Base
  belongs_to :listing
  
  def create
    create! do |success, failure|
      failure.html { redirect_to job_details_path(@listing.job.category, @listing) }
      success.html { redirect_to job_details_path(@listing.job.category, @listing) }
    end
  end
end