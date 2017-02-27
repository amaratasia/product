Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'

  resources :products, only: [:index, :update, :update, :edit]

  # Api definition
  # , constraints: { subdomain: 'api' }
  # namespace :admin, defaults: { format: :json } do
  #   # API resources are listed here
  #   # Version 4
  #   # Style requests and related resources
  #   resources :style_requests, only: [:index], controller: '/api/v4/style_requests' do
  #     collection do
  #       post 'create'
  #       get 'show'
  #     end
  #     member do
  #       post 'update'
  #       post 'delete'
  #       post 'satisfied'
  #     end
  #   end
  # end

  # namespace :api, defaults: { format: :json } do
  #   # API resources are listed here
  #   # Version 4
  #   namespace :v4 do
  #     # Style requests and related resources
  #     resources :style_requests, only: [:index] do
  #       collection do
  #         post 'create'
  #         get 'show'
  #       end
  #       member do
  #         post 'update'
  #         post 'delete'
  #         post 'satisfied'
  #       end
  #     end

  #     # Looks and related resources
  #     resources :looks, only: [:index] do
  #       post 'create', on: :collection
  #       member do
  #         post 'update'
  #         post 'delete'
  #         post 'like'
  #         get 'likes'
  #       end
  #     end

  #     # Style responses and related resources
  #     resources :style_responses, only: [:index] do
  #       post 'create', on: :collection
  #       member do
  #         post 'update'
  #         post 'delete'
  #         post 'like'
  #         get 'likes'
  #       end
  #     end

  #     # User profile related resources
  #     resources :user_profiles, only: [] do
  #       collection do
  #         get 'show'
  #         post 'update'
  #       end
  #     end

  #     # User related resources
  #     resources :users, only: [] do
  #       collection do
  #         post 'login'
  #       end
  #     end

  #     # Routes related to products
  #     resources :products, only: [] do
  #       collection do
  #         post 'like'
  #         get 'likes'
  #       end
  #     end

  #     # User profile images related resources
  #     resources :user_profile_images, only: [] do
  #       collection do
  #         post 'create'
  #         post 'delete'
  #       end
  #     end

  #     # Routes related to app resources
  #     resources :resources, only: [] do
  #       get 'style', on: :collection
  #     end

  #     # Stylist onboarding apis
  #     resources :stylists, only: [:index] do
  #       collection do
  #         get 'questions'
  #         post 'onboard'
  #         get 'performance'
  #         get 'list'
  #         post 'enable'
  #       end
  #     end

  #     # Routes related to app resources
  #     resources :user_devices, only: [] do
  #       post 'update', on: :collection
  #     end

  #     # Notifications related actions
  #     resources :notifications, only: [:index] do
  #     end
  #   end
  # end
end