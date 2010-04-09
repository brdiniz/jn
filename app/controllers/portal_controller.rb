class PortalController < ApplicationController
  def index
    @listings = Listing.published
  end
end

