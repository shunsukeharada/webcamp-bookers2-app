Rails.application.routes.draw do
 root to: 'homes#top'
 get 'home/about', to: 'homes#about'
 devise_for :users
 
 resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
 end
 
 resources :users, only: [:index, :show, :edit, :update]
 resources :group_users, only: [:create, :destroy]
 
 resources :groups, except:[:destroy] do
    get "join" =>"groups#join"
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end
end
