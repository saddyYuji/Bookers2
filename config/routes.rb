Rails.application.routes.draw do
	root 'home#top'
  devise_for :users
	# deviseに作成されたルート
			# GET '/users/sign_in' => 'devise/sessions#new', as: 'new_user_session'
			# POST '/users/sign_in' => 'devise/sessions#create', as: 'user_session'
			# DELETE '/users/sign_out' => 'devise/sessions#destroy', as: 'destroy_user_session'
			# GET '/users/password/new' => 'devise/passwords#new', as: 'new_user_password'
			# GET '/users/password/edit' => 'devise/passwords#edit', as: 'edit_user_password'
			# PATCH '/users/password' => 'devise/passwords#update', as: 'user_password'
			# PUT '/users/password'  => 'devise/passwords#update'
			# POST '/users/password'  => 'devise/passwords#create'
			# GET '/users/cancel' => 'devise/registrations#cancel', as: 'cancel_user_registration'
			# GET '/users/sign_up' => 'devise/registrations#new', as: 'new_user_registration'
			# GET '/users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
			# PATCH '/users' => 'devise/registrations#update', as: 'user_registration'
			# PUT '/users' => 'devise/registrations#update'
			# DELETE '/users' => 'devise/registrations#destroy'
			# POST '/users' => 'devise/registrations#create'
			# GET '/rails/active_storage/blobs/:signed_id/*filename' => 'active_storage/blobs#show', as: 'rails_service_blob'
			# GET '/rails/active_storage/representations/:signed_blob_id/:variation_key/*filename' => 'active_storage/representations#show', as: 'rails_blob_representation'
			# GET '/rails/active_storage/disk/:encoded_key/*filename' => 'active_storage/disk#show', as: 'rails_disk_service'
			# PUT '/rails/active_storage/disk/:encoded_token' => 'active_storage/disk#update', as: 'update_rails_disk_service'
			# POST '/rails/active_storage/direct_uploads' => 'active_storage/direct_uploads#create', as: 'rails_direct_uploads'

	resources :users, only: [:top, :index, :show, :edit, :update]
	# users_controller用ルーティング
			# GET '/users' => 'users#index', as: 'users'
			# GET '/users/:id/edit' => 'users#edit', as: 'edit_user'
			# GET '/users/:id' => 'users#show', as: 'user'
			# PATCH '/users/:id' => 'users#update'
			# PUT '/users/:id' => 'users#update'
	resources :books, only: [:index, :show, :edit, :destroy, :create, :update] # updateは画面なく機能のみ、newはそもそも定義しない
	# books_controller用ルーティング
			# GET '/books' => 'books#index', as: 'books'
			# POST '/books' => 'books#create'
			# GET '/books/:id/edit' => 'books#edit', as: 'edit_book'
			# GET '/books/:id' => 'books#show', as: 'book'
			# DELETE '/books/:id' => 'books#destroy'
	get 'root' => 'home#top'
	get 'home/about' => 'home#about'

end
