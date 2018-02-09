Rails.application.routes.draw do
  resources :events
  resources :users
  resources :organizations
  resources :rooms
  resources :buildings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
