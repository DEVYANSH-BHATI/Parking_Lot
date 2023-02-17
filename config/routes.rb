Rails.application.routes.draw do
  # get 'home/index'
  resources :vehicles
  root "vehicles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
