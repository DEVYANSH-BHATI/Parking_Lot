Rails.application.routes.draw do
  # get 'users/index'
  match '/users',   to: 'users#index',   via: 'get'
  resources :charges
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      unlocks: 'users/unlocks'

    }

  get 'shared/_not_admin'

  get "/vehicles",to: "vehicles#index" , as: "Welcome"
    resources :vehicles do
      member do
        get :charge
        get :leaving
        get :leaved
      end
    end
     resources :charges do
       member do
        get :charge
       end
     end

    # root "home#index"
    root "vehicles#index"

  end
