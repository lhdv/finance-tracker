Rails.application.routes.draw do
  root 'pages#index'
  
  devise_for :users
  
  get 'portifolio', to: 'users#portifolio'
  get 'friends', to: 'users#friends'
  get 'search_friend', to: 'users#search'
  resources :users, only: [:show]
  
  get 'search_stock', to: 'stocks#search'
  
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
end
