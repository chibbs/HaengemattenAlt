Rails.application.routes.draw do
	resources :hammocks
	root 'hammocks#index'
end
