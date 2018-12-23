Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  
  resources :sites
  resources :reviews
end
