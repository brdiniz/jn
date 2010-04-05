class PortalController < ApplicationController
  def index
    @listings = Listing.job_listings
  end
end

