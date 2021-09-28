Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:edit, :update, :index, :show]
  resources :books, only: [:show, :create, :index, :edit, :update, :destroy]
end
