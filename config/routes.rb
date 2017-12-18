Rails.application.routes.draw do
  resources :reservations
  resources :guests

  root "guests#new"
end
