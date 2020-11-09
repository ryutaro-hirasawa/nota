Rails.application.routes.draw do
  get 'notes/index'
  get 'messages/index'
  root "notes#index"
end
