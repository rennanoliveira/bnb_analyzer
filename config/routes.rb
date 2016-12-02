Rails.application.routes.draw do

  root to: 'home#index'

  resources :air_bnbs, only: [:index]

end
