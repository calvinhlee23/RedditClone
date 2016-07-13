Rails.application.routes.draw do
  root 'subs#index'
  resources :users
  resource :session, only: [:destroy,:new, :create ]
  resources :subs
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:destroy, :create, :update, :show]
end
