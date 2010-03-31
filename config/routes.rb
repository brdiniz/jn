ActionController::Routing::Routes.draw do |map|
  map.resources :accounts do |account|
    account.associate_professional "associate_professional", :controller => "accounts", :action => "associate_professional", :method => {:get, :post}
    account.disconnect_professional "disconnect_professional/:login_associate", :controller => "accounts", :action => "disconnect_professional", :method => "put"
		account.resources :emails
    account.resources :jobs do |job|
      job.resources :listings do |listing|
        listing.enable "enable", :controller => "listings", :action => "enable_listing", :method => "put"
        listing.disable "disable", :controller => "listings", :action => "disable_listing", :method => "put"
      end
		end
  end

  map.resources :jobs, :controller => "job_listings"
  map.job_listing_public '/jobs/listings/public', :controller => "job_listings", :action => :updated_listing

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
