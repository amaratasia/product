Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'

  namespace :admin do
    resources :products, only: [:index, :update, :edit]
  end
  
  namespace :api do
    namespace :v1 do
      resources :products, only: [:create], controller: '/admin/products'
    end
  end
end