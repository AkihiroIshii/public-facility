Rails.application.routes.draw do
  get 'toppages/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :facilities
  resources :buildings
  resources :users, only: [:index, :new, :create]
end
