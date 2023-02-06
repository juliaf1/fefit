Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  get '/sobre', to: 'pages#about'

end
