class CandidatesController < ActionController::Base
  
  def new
    @listing = Listing.published.find(params[:listing_id])
  end
  
  def create
    
  end
end