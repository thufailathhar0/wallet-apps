Rails.application.routes.draw do
  root 'users#index'
  resources :transactions
  resources :transfers
  resources :withdraws
  resources :deposits
  resources :stocks
  resources :accounts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
