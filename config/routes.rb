Rails.application.routes.draw do
  root 'users#index'
  resources :libraries
  resources :library_books
  resources :books
  resources :comments
  resources :libraries do
    resources :comments
    resources :library_books, only: [:index, :create, :edit, :update]
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
