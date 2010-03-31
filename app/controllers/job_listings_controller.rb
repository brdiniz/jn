class JobListingsController < ApplicationController
  include JobListingHelper
  
  def index
    @job_listings = Listing.job_listings
  end
  
  def updated_listing
    if request.put?
      generate_job_listing
      flash[:notice] = "Publicação dos anuncios para vagas realizada com sucesso!"
      render :action => "index"
    end
  end
end
