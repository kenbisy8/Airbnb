Rails.application.routes.draw do
  resources :rooms, only: [:index, :new, :create, :show] do
    resources :orders, only: [:new, :create]
  end
  root 'rooms#index'
end
