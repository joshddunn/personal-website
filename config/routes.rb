Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: 'new_user_session'
    post 'login', to: 'devise/sessions#create', as: 'user_session'
    delete 'logout', to: 'devise/sessions#destroy', as: 'destroy_user_session'
  end 

  resources :article
  
  root "article#index"
end
