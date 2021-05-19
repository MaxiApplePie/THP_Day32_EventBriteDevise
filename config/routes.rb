Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  get 'static_pages/index'
  get 'static_pages/secret'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :users, only: [:show]
end
