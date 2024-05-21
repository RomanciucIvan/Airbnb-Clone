Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  resources :apartments do
    resources :reviews, only: [:new, :create, :destroy]
    resources :bookings, only: [:new, :create, :index, :show] do
      collection do
        get 'calendar'
      end
    end
  end
end
