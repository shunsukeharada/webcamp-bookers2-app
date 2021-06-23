Rails.application.routes.draw do
  devise_for :installs
 devise_for :users
 root to: 'homes#top'
 resources :books, only: [:create, :index, :show, :edit, :destroy]
end
