Rails.application.routes.draw do
	get 'home/index'
	
	resources :hammocks
	
	root 'home#index'
end
