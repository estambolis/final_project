Rails.application.routes.draw do
  # Routes for the Target resource:
  # CREATE
  get "/targets/new", :controller => "targets", :action => "new"
  post "/create_target", :controller => "targets", :action => "create"

  # READ
  get "/targets", :controller => "targets", :action => "index"
  get "/targets/:id", :controller => "targets", :action => "show"

  # UPDATE
  get "/targets/:id/edit", :controller => "targets", :action => "edit"
  post "/update_target/:id", :controller => "targets", :action => "update"

  # DELETE
  get "/delete_target/:id", :controller => "targets", :action => "destroy"
  #------------------------------

  # Routes for the Follow resource:
  # CREATE
  get "/follows/new", :controller => "follows", :action => "new"
  post "/create_follow", :controller => "follows", :action => "create"

  # READ
  get "/follows", :controller => "follows", :action => "index"
  get "/follows/:id", :controller => "follows", :action => "show"

  # UPDATE
  get "/follows/:id/edit", :controller => "follows", :action => "edit"
  post "/update_follow/:id", :controller => "follows", :action => "update"

  # DELETE
  get "/delete_follow/:id", :controller => "follows", :action => "destroy"
  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :registrations => 'registrations'}
  # Routes for the Restaurant resource:
  root "experiences#index"

  # CREATE
  get "/restaurants/new", :controller => "restaurants", :action => "new"
  post "/create_restaurant", :controller => "restaurants", :action => "create"

  # READ
  get "/restaurants", :controller => "restaurants", :action => "index"
  get "/restaurants/:id", :controller => "restaurants", :action => "show"

  # UPDATE
  get "/restaurants/:id/edit", :controller => "restaurants", :action => "edit"
  post "/update_restaurant/:id", :controller => "restaurants", :action => "update"

  # DELETE
  get "/delete_restaurant/:id", :controller => "restaurants", :action => "destroy"
  #------------------------------

  # Routes for the Experience resource:
  # CREATE
  get "/experiences/new", :controller => "experiences", :action => "new"
  post "/create_experience", :controller => "experiences", :action => "create"

  # READ
  get "/experiences", :controller => "experiences", :action => "index"
  get "/experiences/:id", :controller => "experiences", :action => "show"

  # UPDATE
  get "/experiences/:id/edit", :controller => "experiences", :action => "edit"
  post "/update_experience/:id", :controller => "experiences", :action => "update"

  # DELETE
  get "/delete_experience/:id/:restaurant_id", :controller => "experiences", :action => "destroy"
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
