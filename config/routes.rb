Rails.application.routes.draw do
  #Root page is login
  root 'application#login'
  #link to signup
  get 'application/signup'
  #Main angular application
  get 'application/angular'


  get '/signup' => 'session#welcome'
  #root 'session#welcome'

  #all RESTful routes exist for teams
  resources :teams

  #all RESTful routes exist for teams
  resources :users

  #all RESTful routes exist for teams, but are formatted as JSON
  resources :todos, defaults: { format: :json }

  #the only RESTful routes that exist for sessions are create and delete
  get '/login' => 'session#login'
  get '/session' => 'session#logged_in_user'
  post '/session' => 'session#create'
  delete '/session' => 'session#destroy'
  
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
