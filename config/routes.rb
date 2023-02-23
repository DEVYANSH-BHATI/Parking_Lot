Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  # get 'home/index'
  resources :vehicles
  root 'home#index'
=======
  # get 'home/index'
  resources :vehicles
  root "vehicles#index"
>>>>>>> 94123aba118a5c9d3bdd8108a019cea1ccaf1fdd
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
