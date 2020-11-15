Rails.application.routes.draw do
  devise_for :users
  root to: "notes#index"
  resources :notes, only: [:index, :new, :create, :show, :destroy]
  resources :users, only: :show
  get'/show/:id' => 'notes#show'
end
