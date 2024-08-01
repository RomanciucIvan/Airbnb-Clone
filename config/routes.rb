Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'host', to: 'pages#host'
  get 'search', to: 'search#index'
  get 'vlad', to: 'pages#vlad'
  get "user", to: 'user#show'

  resources :users do
    resources :bookings, only: [:destroy]
  end
  resources :apartments do
    resources :reviews, only: [:new, :create, :destroy]
    resources :bookings, only: [:new, :create, :index, :show] do
      collection do
        get 'calendar'
      end
    end
  end
  resources :bookings, only: [:update] do
    resources :chatrooms, only: [:show, :index, :create]
  end
  resources :chatrooms, only: [] do
    resources :messages, only: :create
  end
end
