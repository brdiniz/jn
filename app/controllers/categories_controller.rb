class CategoriesController < AuthenticateController
 load_and_authorize_resource
 respond_to :xml, :only => [:index]
 
end