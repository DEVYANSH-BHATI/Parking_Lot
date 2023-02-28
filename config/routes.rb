Rails.application.routes.draw do
  get 'charges/charges'
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      unlocks: 'users/unlocks'
    }
    # get '/vehicles' , to: redirect('/vehicles'),as: 'jake'
    resources :vehicles
    root "home#index"

  end
