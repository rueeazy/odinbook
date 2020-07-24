Rails.application.routes.draw do
  
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'

  devise_for :users, :path => 'u', :controllers => { registrations: 'registrations' }
  resources :users, :only =>[:show, :index]
  resources :posts do
    resources :comments
  end
  root to: 'posts#index'
end
