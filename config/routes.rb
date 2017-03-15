Rails.application.routes.draw do
  root to: 'pages#index'

  resources :references, only: [:new, :create]
end
