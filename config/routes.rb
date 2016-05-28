Rails.application.routes.draw do
  post 'auth/facebook', to: 'auth#facebook'
  post 'auth/github', to: 'auth#github'
  root to: 'home#index'
end
