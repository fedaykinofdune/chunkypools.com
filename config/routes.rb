ChunkyPools::Application.routes.draw do
  resources :articles, only: [:index, :show]

  resource :dashboard

  get '/api/pool/status' => 'api#pool_status'
  get '/api/user/balances' => 'api#user_balances'
  get '/api/coin/exchange_rates' => 'api#current_exchange_rates'
  get '/api/coin/exchange_rates/current' => 'api#current_exchange_rates'
  get '/api/coin/exchange_rates/yesterday' => 'api#yesterday_exchange_rates'
  get '/api/coin/exchange_rates/yesterday' => 'api#yesterday_exchange_rates'
  get '/api/markets' => 'api#all_market_data'
  get '/api/markets/:market_name' => 'api#market_data'

  get '/account' => 'account#show'
  get '/faq' => 'pages#faq'
  get '/login' => 'pages#login'
  get '/logout' => 'pages#logout'
  get '/register' => 'pages#register'
  get '/chat' => 'pages#chat'
  get '/contact' => 'pages#contact'

  get '/doge' => redirect('http://chunkypools.com:22550')

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"

  root 'dashboard#show'

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
