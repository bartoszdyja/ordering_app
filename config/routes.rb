Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resource :user
    resources :orders
    resources :meals
  end
  post 'auth/facebook', to: 'auth#facebook'
  post 'auth/github', to: 'auth#github'
  root to: 'home#index'
end
