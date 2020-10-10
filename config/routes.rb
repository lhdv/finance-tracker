Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users

  get 'portifolio', to: 'users#portifolio'
end
