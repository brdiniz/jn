class PortalController < ActionController::Base
  def index
    @listings = Listing.published
  end
  
  def show
    @category = Category.find(params[:category_id])
    @listing = Listing.published.find(params[:listing_id])
  end
end

