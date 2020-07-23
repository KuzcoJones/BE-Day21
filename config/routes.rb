Rails.application.routes.draw do
  
  # make specific route for auth show = current user
  resources :auth, only: [:create]
  resources :habit_tags
  resources :tags, only: [:index, :show, :create, :update]
  resources :daily
  resources :habits
  resources :users, only: [:index, :show, :update]
  resources :daily_habits, only: [:index, :create, :show]

  get 'myuser', to: 'auth#show', as: '/myuser'
  post 'signup', to: 'users#create', as: '/signup'
  delete 'remove_daily', to: 'daily_habits#destroy', as: '/remove_daily'
  patch 'update_daily', to: 'daily_habits#update', as: '/update_daily'
end
