Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  resource :session, only: [:create, :destroy]
  resources :teachers, only: [:index, :new, :create, :show]
  resources :parents, only: [:index, :new, :create, :show]
  resources :students, only: [:index, :new, :create, :show]
  resources :grades, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:edit, :update]

  get '/comments/new/:commentable_type/:commentable_id', controller: :comments, action: :new, as: :new_comment

  post '/comments/:commentable_type/:commentable_id', controller: :comments, action: :create, as: :comments

  delete '/comments/:commentable_type/:commentable_id', controller: :comments, action: :delete

end
