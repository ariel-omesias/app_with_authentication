Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'

  resources :stories
  resources :users, only: [:new, :create, :show]

  get 'my_stories', to: 'stories#my_stories'

  root 'stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
