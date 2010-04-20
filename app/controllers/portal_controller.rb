class PortalController < ActionController::Base
  def index
    @listings = Listing.published
  end
  
  def category_listing
    @category = Category.find(params[:category_id])
    @listings = Listing.list_jobs_for_category(@category)
  end
end

