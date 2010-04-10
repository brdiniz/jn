class PortalController < ActionController::Base
  def index
    @listings = Listing.published
  end
  
  def show
    @listing = Listing.published.find(params[:listing_id])
  end
end

