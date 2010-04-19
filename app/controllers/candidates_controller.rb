class CandidatesController < InheritedResources::Base
  belongs_to :listing
  
  def create
    super do |format|
      format.html { redirect_to job_details_path(@listing.job.category, @listing) }
    end
  rescue  Exception => e
    flash[:error] = e.message
    redirect_to job_details_path(@listing.job.category, @listing)
  end
  
end