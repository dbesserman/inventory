Rails.application.routes.draw do
  root to: 'pages#index'

  resources :references, only: [:new, :create]

  resources :movements, only: [:index, :new, :create]

  resources :items, only: [:index] do
    member do
      post 'book'
    end
  end
end
