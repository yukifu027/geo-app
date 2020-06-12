Rails.application.routes.draw do
  devise_for :users
  root "guides#index"
  resources :users, only: [:edit, :update] 
  resources :likes, only: :index
  resources :guides, only: :show do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    resources :pictures, only: :index
    member do
      post 'pay'
    end
  end
end