Rails.application.routes.draw do
  
  # make specific route for auth show = current user
  resources :auth, only: [:create, ]
  resources :habit_tags
  resources :tags, only: [:index, :show, :create, :update]
  resources :daillies
  resources :habits
  resources :users, only: [:index, :show, :create, :update]

  get 'myuser', to: 'auth#show', as: '/myuser'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
