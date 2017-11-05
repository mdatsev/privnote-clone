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
  post '/notes/api', to: 'notes#create'
  get '/:slug', to: 'notes#show'
  get '/:slug/info', to: 'notes#info'
  post '/:slug/raw', to: 'notes#raw'
  get '/:slug/raw', to: 'notes#raw'
  resources :users
  post '/users/new', to: 'users#create'
end
