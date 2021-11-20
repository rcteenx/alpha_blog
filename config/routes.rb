Rails.application.routes.draw do
  #root 'application#hello'
  root 'pages#home'
  get 'about', to: 'pages#about'
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # if we expose all CRUDS - we do not need only! REST-ful routes
  resources :articles
end
