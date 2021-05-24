Rails.application.routes.draw do
  root 'events#index'

  devise_for :users

  resources :users, only: [:show]
  
  resources :events do
    resources :img_event, only: [:create, :update]
  end

  namespace :admin do
    root 'admin#index'
    resources :users
    resources :admin, only: [:index]
    resources :events
    resources :attendances, only: [:index]
  end
  




  # get 'static_pages/index'
  # get 'static_pages/secret'


end