Rails.application.routes.draw do
  resources :balances
  resources :operations
  root to: 'start#index'
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
