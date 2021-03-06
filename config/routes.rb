Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "jobs#index"
  resources :jobs
  resources :rooms, only: [:new, :create, :destroy, :index] do
    resources :messages, only: [:index, :create]
  end
end
