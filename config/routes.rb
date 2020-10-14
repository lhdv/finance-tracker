Rails.application.routes.draw do
  root 'pages#index'
  
  devise_for :users
  
  get 'portifolio', to: 'users#portifolio'
  
  get 'search_stock', to: 'stocks#search'
  
  resources :user_stocks, only: [:create]
end
