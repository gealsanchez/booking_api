Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :automobiles
      resources :tickets
      resources :users, only: [:show, :destroy]
    end
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
