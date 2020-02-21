Rails.application.routes.draw do
  devise_for :users

  root to: "games#index"

  resources :games, only: [:index] do
    resources :playthroughs, only: [:create]
  end
end
