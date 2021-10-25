Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :user do
    get 'profile', to: "profile#show"
    get 'can_follow', to: "profile#can_follow"
    get 'following', to: "profile#following"
    get 'followers', to: "profile#followers"
    resource :posts, only: :create

    post 'follow/:id', to: 'subscriptions#follow', as: :follow
    post 'unfollow/:id', to: 'subscriptions#unfollow', as: :unfollow
  end

end
