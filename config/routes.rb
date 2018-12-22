Rails.application.routes.draw do
  resources :reviews
	get 'home/index'
	
	resources :hammocks
	
	root 'home#index'
end
