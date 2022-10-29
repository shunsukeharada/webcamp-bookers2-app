Rails.application.routes.draw do
 root to: 'homes#top'
 get 'home/about', to: 'homes#about'
 devise_for :users
 
 resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
 end
 
 resources :users, only: [:index, :show, :edit, :update]
 resources :groups, except: [:destroy]
 resources :group_users, only: [:create, :destroy]
end
