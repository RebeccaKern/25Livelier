Rails.application.routes.draw do
  resources :events
  resources :users
  resources :organizations
  resources :rooms
  resources :buildings
  resources :sessions
  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Default route
  get '/', to: 'home#index', as: :home
  get 'events/create' => 'events#create', as: :create

end
