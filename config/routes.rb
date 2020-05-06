Rails.application.routes.draw do
  devise_for :users

  root 'home#top'
  get 'home/about'

  resources :users,only: [:show,:index,:edit,:update] do
    get 'follower' => 'users#follower'
    get 'followed' => 'users#followed'
    resource :relationships, only: [:create, :destroy]
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy], shallow: true
  end
end
