Rails.application.routes.draw do
  resources :flats
  devise_for :users
  root to: "pages#home"
  get 'host', to: 'pages#host'
  get 'search', to: 'search#index'
  get 'vlad', to: 'pages#vlad'
    # get '*path' => 'application#serve_static_asset'
  resources :apartments do
    resources :reviews, only: [:new, :create, :destroy]
    resources :bookings, only: [:new, :create, :index, :show] do
      collection do
        get 'calendar'
      end
    end
  end
end
