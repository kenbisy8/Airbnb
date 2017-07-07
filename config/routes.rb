Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations:  "users/registrations",
    sessions:       "users/sessions"
    }
  resources :rooms, only: [:index, :new, :create, :show] do
    resources :orders, only: [:new, :create]
  end
  resources :users, only: [:edit, :update]
  resources :diaries
  root 'rooms#index'
end
