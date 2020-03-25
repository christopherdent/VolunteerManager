Rails.application.routes.draw do

  resources :groups
  resources :volunteers
  resources :users

  get '/' => 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  get '/users/index' => 'users#index', as: :user_home

  resources :groups, only: [:show] do
     # nested resource for vols
     resources :volunteers, only: [:show, :index]
   end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
