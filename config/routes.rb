Rails.application.routes.draw do
  resources :rooms, only: :index
  root 'rooms#index'
end
