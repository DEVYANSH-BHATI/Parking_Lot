Rails.application.routes.draw do
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      unlocks: 'users/unlocks'

    }

    get "/vehicles",to: "vehicles#index"
    resources :vehicles

    root "home#index"

  end
