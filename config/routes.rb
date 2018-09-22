Rails.application.routes.draw do
  resources :items
  devise_for :users
  get 'home/index'
  root to: 'home#index'
end
