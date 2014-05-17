Group::Application.routes.draw do

  root to: 'reviews#index'

  resources :games do
    resources :reviews
  end
  resources :users

end
