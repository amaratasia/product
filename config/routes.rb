Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'

  namespace :admin do
    resources :products, only: [:index, :update, :edit], controller: '/api/v1/products'
  end
  
  namespace :api do
    namespace :v1 do
      resources :products, only: [:create]
    end
    namespace :v2 do
      resources :products, only: [:create]
    end
  end
end