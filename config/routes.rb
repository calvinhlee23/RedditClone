Rails.application.routes.draw do
  # root
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :posts
end