Group::Application.routes.draw do

  root to: 'games#index'

  resources :games do
    resources :reviews
  end
  resources :users
  resources :comments
end
