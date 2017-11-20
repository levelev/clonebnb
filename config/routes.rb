Rails.application.routes.draw do
  get 'bookings/new'

  get 'bookings/show'

  # get 'listings/index'

  # get 'listings/show'

  # get 'listings/create'

  # get 'listings/new'

  # get 'listings/edit'

  # get 'listings/update'

  resources :listings, except: [:destroy]
  recources :bookings, only: [:show, :new, :create]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
