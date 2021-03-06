Rails.application.routes.draw do

  root "movies#index"
  resources :genres
  
  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  resources :users
  get "signup" => "users#new"

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies

end