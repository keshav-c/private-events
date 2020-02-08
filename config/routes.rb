Rails.application.routes.draw do
  get '/events/new', to: 'events#new'
  post '/events', to: 'events#create'
  get '/events/:id', to: 'events#show'
  get '/events', to: 'events#index'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
end
