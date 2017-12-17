Rails.application.routes.draw do
  resources :reservations
  resources :guests

  root "reservations#index"
end
