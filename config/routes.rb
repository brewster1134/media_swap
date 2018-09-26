Rails.application.routes.draw do
  devise_for :users

  resources :items do
    get 'return'
    get 'borrow'
  end

  get 'home/index'
  root to: 'home#index'
end
