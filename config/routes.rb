Rails.application.routes.draw do
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :notes, param: :slug, path: '/'
  root 'notes#index'
end
