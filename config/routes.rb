# frozen_string_literal: true
Rails.application.routes.draw do
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  # get '/get-user-name' => 'users#get_User_Name'
  resources :users, only: [:index, :show]

  get '/user_items', to: 'user_items#index'
  get '/retrieve_user_items/:user_id', to: 'user_items#retrieve_user_items'
  post '/add-user-item' => 'user_items#add_user_item'
  delete '/delete-user-item/:id' => 'user_items#delete_user_items'
  get '/search-items' => 'user_items#search_user_items'
  patch '/edit-user-item/:id' => 'user_items#update_user_items'

  post '/request-item' => 'requests#request_user_item'
end
