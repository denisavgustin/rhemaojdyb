Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/plates/:plate_size', to: 'plates#index', as: 'plates_with_size'
  get '/plates', to: 'plates#index', as: 'plates'
  
end
