class PortalController < ActionController::Base
  def show
    @listing = Listing.published.find(params[:listing_id])
    @category = Category.find(params[:category_id])
  end
  
  def index
    @listings = Listing.published
  end
  
  def category_listing
    @category = Category.find_by_name(params[:category_id])
    @listings = Listing.list_jobs_for_category(@category)
  end
end

