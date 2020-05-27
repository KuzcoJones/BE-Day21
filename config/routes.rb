Rails.application.routes.draw do
  
  resources :auth, only: [:create, :show]
  resources :habit_tags
  resources :tags, only: [:index, :show, :create, :update]
  resources :daillies
  resources :habits
  resources :users, only: [:index, :show, :create, :update]

  get 'auth/facebook/callback' => 'auth#create'
  get 'auth/google/callback' => 'auth#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
