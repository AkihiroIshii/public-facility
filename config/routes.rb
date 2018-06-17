Rails.application.routes.draw do
  root to: 'facilities#index'
  
  resources :facilities
  resources :buildings
  resources :users
end
