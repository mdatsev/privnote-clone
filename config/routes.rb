Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/signup', to: 'users#new'
  get '/signup', to: 'users#new'

  post '/paypal', to: "paypal#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'notes#new'
  post '/', to: 'notes#create', as:"notes"
  get '/:slug', to: 'notes#show'
  post '/:slug/raw', to: 'notes#raw'
  resources :users
  post '/users/new', to: 'users#create'
end
