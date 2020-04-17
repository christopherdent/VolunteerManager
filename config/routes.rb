Rails.application.routes.draw do

  resources :groups
  resources :volunteers
  resources :users
  resources :group_volunteers
  #  post '/group_volunteers/new' => 'group_volunteers#new'

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'


  resources :groups do
    member do
     # nested resource for vols
     patch :update_two
     put :update_two
   end
end

resources :groups do
  resources :volunteers do
    member do
  delete :remove_from_group
    end
  end
end

resources :volunteers do
  # nested resource for vols
    resources :groups
end


resources :group_volunteers do
  member do
    get :delete_statement
  end
end


get '/auth/:provider/callback' => 'sessions#omniauth' #OmniAuth Route 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
