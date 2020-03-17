Rails.application.routes.draw do
  devise_for :users

	resources :pics do 
		member do
			put 'toggle_like', to: 'pics#toggle_like'
		end
	end
	
	root 'pics#index'

	get 	 'users/:id' 				=> 'users#show', 		as: :profile
	get 	 'users/:id/edit' 	=> 'users#edit', 		as: :edit_profile
	patch  'users/:id/edit' 	=> 'users#update'
	delete 'users/:id' 				=> 'users#destroy'
end
