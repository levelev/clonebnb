Rails.application.routes.draw do

  resources :listings, except: [:destroy] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show]

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
end
