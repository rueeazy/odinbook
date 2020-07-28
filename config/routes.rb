Rails.application.routes.draw do

  devise_for :users, :path => 'u', :controllers => { registrations: 'registrations' }
  resources :users, :only =>[:show, :index]
  resources :friendships
  resources :posts do
    resources :comments
  end
  root to: 'posts#index'
end
