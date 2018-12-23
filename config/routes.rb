Rails.application.routes.draw do
  resources :sites
  resources :entries
  resources :reviews
  resources :hammocks
  
  get 'home/index'
  root 'home#index'
end
