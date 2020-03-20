Rails.application.routes.draw do
  devise_for :users

	resources :pics do 
		resources :comments
		member do
			put 'toggle_like', to: 'pics#toggle_like'
			put 'edit_modal',  to: 'pics#edit_modal'
		end
	end
	
	root 'pics#index'

	get 	 'users/:id', 		 to: 'users#show', 	as: :profile
	get 	 'users/:id/edit', to: 'users#edit', 	as: :edit_profile
	patch  'users/:id/edit', to: 'users#update'
	delete 'users/:id', 		 to: 'users#destroy'
end
