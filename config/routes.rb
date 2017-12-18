Rails.application.routes.draw do
  resources :reservations
  resources :guests
  resources :beds

  root "guests#new"
end
