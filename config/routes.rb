Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :automobiles
      resources :tickets
      resources :users, only: [:show, :destroy]
    end
  end
end