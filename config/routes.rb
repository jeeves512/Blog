Rails.application.routes.draw do
  resources :publications
  devise_for :users
  root 'pages#index'
  get 'about', to: 'pages#about'

  resources :articles

end
