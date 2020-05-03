Rails.application.routes.draw do
  devise_for :users

  root 'home#top'
  get 'home/about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  resource :favorites, only: [:create, :destroy]
  resource :book_comments, only: [:create, :destroy]
end
