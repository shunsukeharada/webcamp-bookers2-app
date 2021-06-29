Rails.application.routes.draw do
  devise_for :installs
 devise_for :users
 root to: 'homes#top'
 get 'home/about', to: 'homes#about'
 patch 'books/:id', to: 'books#update'
 resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
 resources :users, only: [:index, :show, :edit, :update]
end
