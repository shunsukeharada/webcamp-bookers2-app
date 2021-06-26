Rails.application.routes.draw do
  devise_for :installs
 devise_for :users
 root to: 'homes#top'
 get 'home/about', to: 'homes#about'
 resources :books, only: [:create, :index, :show, :edit, :destroy]
 resources :users, only: [:index, :show, :edit, :update]
end
