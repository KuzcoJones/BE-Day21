Rails.application.routes.draw do
  
  # make specific route for auth show = current user
  resources :auth, only: [:create]
  resources :habit_tags
  resources :tags, only: [:index, :show, :create, :update]
  resources :daily
  resources :habits
  resources :users, only: [:index, :show, :update]
  resources :daily_habits, only: [:index, :create, :show, :update]

  get 'myuser', to: 'auth#show', as: '/myuser'
  post 'signup', to: 'users#create', as: '/signup'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
