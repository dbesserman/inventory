Rails.application.routes.draw do
  root to: 'pages#index'

  resources :references, only: [:new, :create]
  resources :movements, only: [:index, :new, :create]
end
