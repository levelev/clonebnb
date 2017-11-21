Rails.application.routes.draw do


  devise_for :views
  resources :listings, except: [:destroy]
  resources :bookings, only: [:show, :new, :create]
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
