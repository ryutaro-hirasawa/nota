Rails.application.routes.draw do
  devise_for :users
  root to: "notes#index"
  resources :notes, only: [:index, :new, :create, :show, :destroy] do
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show do
    get :favorites, on: :collection
  end
  get'/show/:id' => 'notes#show'
end
