Rails.application.routes.draw do
  resources :charges
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      unlocks: 'users/unlocks'

    }

    # get "/vehicles",to: "vehicles#index" , as: "Welcome"
    resources :vehicles

    root "home#index"

  end
