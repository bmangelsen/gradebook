Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  resource :session, only: [:create, :destroy]
  resources :teachers, only: [:index, :new, :create, :show]
  resources :parents, only: [:index, :new, :create, :show]
  resources :students, only: [:index, :new, :create, :show]
  resources :grades, only: [:index, :new, :create, :edit, :update, :destroy]

end
