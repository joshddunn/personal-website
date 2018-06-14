Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: 'new_user_session'
    post 'login', to: 'devise/sessions#create', as: 'user_session'
    delete 'logout', to: 'devise/sessions#destroy', as: 'destroy_user_session'
  end

  resources :articles
  resources :screenshots, only: %i[create destroy]
  resources :resumes, only: %i[new create destroy]

  root 'articles#index'
end
