Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Resources routes
  resources :resources
  resources :reviews, only: [:new, :create]

  resources :reviews, only: [:destroy]

  authenticated :user do
    resource :profile, only: [:show, :edit, :update, :new, :create, :destroy]
  end
  # Bookmarks routes
  resources :bookmarks, only: [:create, :destroy]

  # Define bookmarks index route
  get '/bookmarks', to: 'bookmarks#index'

  # Custom route for creating a bookmark
  post '/resources/:id/bookmark', to: 'bookmarks#create', as: 'bookmark_resource'

end
