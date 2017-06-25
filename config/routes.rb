Rails.application.routes.draw do
  resources :libraries
  resources :library_books
  resources :books
  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
