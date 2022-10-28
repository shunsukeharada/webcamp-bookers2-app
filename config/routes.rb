Rails.application.routes.draw do
 root to: 'homes#top'
 get 'home/about', to: 'homes#about'
 devise_for :users
 resources :users
 resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
 end
 resources :messages, only: [:create]
 resources :rooms, only: [:create,:show]
 
end
