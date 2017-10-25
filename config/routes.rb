Rails.application.routes.draw do
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :notes, param: :slug, path: '/'
  resources :users
  post '/users/new', to: 'users#create'
  root 'notes#index'
end
