Rails.application.routes.draw do
  resources :sites
  resources :reviews
  
  get 'home/index'
  root 'home#index'
end
