Rails.application.routes.draw do
  devise_for :users
  root "guides#index"
  resources :users, only: [:edit, :update]
end
