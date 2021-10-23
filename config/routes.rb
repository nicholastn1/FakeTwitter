Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :user do
    get 'profile', to: "profile#show"
    resource :posts, only: :create
  end

end
