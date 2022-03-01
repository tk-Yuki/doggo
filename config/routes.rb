Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'homes/top'
  root to: 'homes#top'

  resources :users, only: [:show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end

  resources :places
  resources :place_images, only: [:destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
end
