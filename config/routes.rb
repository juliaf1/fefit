Rails.application.routes.draw do

  namespace :admin do
      resources :clients
      resources :super_admins
      resources :addresses
      resources :meals
      resources :cart_meals
      resources :coupons
      resources :orders

      root to: "clients#index"
    end
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  get '/sobre', to: 'pages#about'

end
