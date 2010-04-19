class PortalController < ActionController::Base
  def index
    @listings = Listing.published
  end
  
  def show
    @category = Category.find(params[:category_id])
    @listing = Listing.published.find(params[:listing_id])
  end
  
  def category_listing
    @category = Category.find(params[:category_id])
    @listings = Listing.published.find(:all, :joins => :job, :conditions => { :jobs => { :category_id => @category.id } })
  end
end

