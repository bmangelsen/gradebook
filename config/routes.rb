Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  resource :session, only: [:create, :destroy]
  resources :teacher, only: [:new, :create, :show]
  resources :parent, only: [:new, :create, :show]
  resources :student, only: [:new, :create, :show]
  resources :grade, only: [:new, :create, :index, :show]

end
