Rails.application.routes.draw do
  resources :volunteer_groups
  resources :groups

  resources :volunteers

  resources :users

  get '/' => 'sessions#welcome'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'signup' => 'users#new'
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
