Rails.application.routes.draw do
  root to: 'movements#index'

  resources :references, only: [:new, :create] do
    member do
      get :movements
      get :items
    end
  end

  resources :movements, only: [:index, :new, :create]
  post '/movements/filter', to: 'movements#filter'

  resources :items, only: [:index] do
    member do
      post 'book'
    end
  end
  post '/items/filter', to: 'items#filter'
end
