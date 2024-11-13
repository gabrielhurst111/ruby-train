Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :articles
  root 'articles#index'
  get '/signup', to: 'users#new'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/profile', to: 'users#show', as: 'profile'
  get '/profile/edit', to: 'users#edit', as: 'edit_profile'
  patch 'profile', to: 'users#update'
  

  # Defines the root path route ("/")
  # root "articles#index"
end
