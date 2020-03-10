Rails.application.routes.draw do
  resources :comments
  resources :volunteer_groups
  resources :groups
  resources :users
  resources :volunteers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
