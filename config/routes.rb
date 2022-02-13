Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'homes/top'
  root to: 'homes#top'
  
  resources :users, only: [:show, :edit, :update]
  get 'users/follows'
  get 'users/followers'
  
  resources :places
  resources :posts
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
