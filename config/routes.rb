Rails.application.routes.draw do
  resources :things
  get 'home/index'
  root 'home#index'

  resources :sizes
  resources :sites
  resources :reviews
  resources :users do
    member do
      post :promote
    end
  end
  resources :sessions, only: [:new, :create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :sites, only: [:index, :create, :show, :update, :destroy]
      resources :reviews, only: [:index, :create, :show, :update, :destroy]
    end
  end
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
