Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "notes#index"
  resources :notes do
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
      get 'detail_search'
    end
  end
  resources :users, only: [:show, :edit, :update, :destroy] do
    get :favorites, on: :collection
  end
  # get'/show/:id' => 'notes#show'
end
