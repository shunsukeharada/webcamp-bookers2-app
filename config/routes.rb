Rails.application.routes.draw do
  devise_for :installs
 devise_for :users
 root to: 'homes#top'
end
