Rails.application.routes.draw do

  resources :groups
  resources :volunteers
  resources :users
  resources :group_volunteers


  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  get '/users/index' => 'users#index', as: :user_home

  resources :groups do
    member do
     # nested resource for vols
     patch :update_two
     put :update_two
   end
 end 

   resources :volunteers do
      # nested resource for vols
      resources :groups
    end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
