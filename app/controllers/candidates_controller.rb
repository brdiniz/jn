class CandidatesController < ActionController::Base
  
  def new
    @listing = Listing.published.find(params[:listing_id])
    @category = @listing.job.category
  end
  
  def create
    @listing = Listing.published.find(params[:listing_id])
    @category = @listing.job.category
    @candidate = Candidate.new(:listing => @listing, :name => params[:candidate][:name], :observation => params[:candidate][:observation], :site => params[:candidate][:site], :email => params[:candidate][:email])
    if @candidate.save
      flash[:notice] = 'Currículo enviado com sucesso!'
      redirect_to(category_list_path(@listing.job.category.name))
    else
        render :action => "new"
    end
  end 
end