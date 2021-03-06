Rails.application.routes.draw do
  resources :locations
  resources :sessions
  resources :users
  resources :users
  resources :users
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  get '/calendar' => 'calendar#index'
  get '/aboutUs' => 'welcome#aboutUs'
  get '/welcome' => 'welcome#index'
 get '/location' => 'welcome#location'

  # get 'maps' => 'maps#index'


  # Api definition
# namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
#   # We are going to list our resources here
# end
#
#   resources :posts
#
#   devise_for :new_users
  #resources :widgets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

  get '/signup'  => 'users#new'

  get 'admin' => 'users#admin'
  get 'edit'  => 'users#edit'

  resources :users
  resources :posts


  get 'login', :to => 'sessions#new'
  post 'login', :to => 'sessions#create'
  get 'logout', :to => 'sessions#logout'

  get '/post' => 'posts#index'
  # get '/post_search', to: redirect('/posts')
  get '/posts/new', to: redirect('/posts')
  post 'post' => 'posts#create'
  # match '/post_search' => 'posts#post_search', :via => :post
  match '/post/new' => 'posts#new', :via => :post


  resources :users, defaults: { format: 'html' }, only: [:new, :create, :edit, :update, :index, :destroy] do
      member do
        get :profile
        get :settings
      end
    end



  # get '/calendar' => 'calendar#index'
  # resources :calendar
  #
  # # Api definition
  # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
  #   # We are going to list our resources here
  # end
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
