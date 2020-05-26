Rails.application.routes.draw do
  get 'habit_tag/index'
  get 'habit_tag/show'
  get 'habit_tag/create'
  get 'habit_tag/edit'
  get 'habit_tag/destroy'
  resources :tags, only: [:index, :show, :create, :update]
  resources :daillies
  resources :habits
  resources :users, only: [:index, :show, :create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
