Rails.application.routes.draw do
  get 'guides/index'

  root "guides#index"
end
