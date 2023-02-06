Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :clients
      resources :super_admins
      resources :addresses

      root to: "users#index"
    end
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  get '/sobre', to: 'pages#about'

end
