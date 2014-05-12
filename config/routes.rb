Group::Application.routes.draw do
  root to: 'reviews#index'
 
  resources :reviews do
    resources :games
  end
  
end
