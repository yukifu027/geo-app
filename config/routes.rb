Rails.application.routes.draw do
  devise_for :users
  root "guides#index"
  resources :users, only: [:edit, :update]
  resources :guides, only: :show do
    resources :comments, only: :create
  end
end
