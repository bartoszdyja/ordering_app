Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resource :user, only: :show
    resources :orders, only: [:create, :show, :index, :update]
    resources :meals, only: [:create, :show, :update, :index]
  end
  post 'auth/facebook', to: 'auth#facebook'
  post 'auth/github', to: 'auth#github'
  root to: 'home#index'
end
