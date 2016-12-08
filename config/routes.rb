Rails.application.routes.draw do

  get 'about/air_bnb', 'about#air_bnb'

  root to: 'home#index'

  resources :air_bnbs, only: [:index]
  resources :dwellings, only: [:index]

  resource :geocoder, only: [:show]

end
