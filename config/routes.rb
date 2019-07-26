Rails.application.routes.draw do
	root 'application#index'
	resources :cars
end
