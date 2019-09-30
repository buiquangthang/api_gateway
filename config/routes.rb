Rails.application.routes.draw do
  post   'user_token'      => 'user_token#create'

  # Home controller routes.
  root   'home#index'
  get    'auth'            => 'home#auth'

  resources :routes
  resources :services
end
