Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index,:create,:show] do
        resources :tickets, only: [:index, :create]
      end
      resources :automobiles, only: [:index, :show, :create, :destroy]
    end
  end
end