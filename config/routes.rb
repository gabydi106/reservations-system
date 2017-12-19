Rails.application.routes.draw do
  resources :reservations
  resources :guests
  resources :beds

  root "guests#new"

  post "reservations/:id/checkin", to: "reservations#assign_beds", as: :reservation_check_in
  post "reservations/:id/checkout", to: "reservations#unassign_beds", as: :reservation_check_out
end
