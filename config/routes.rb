Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :apartments do
    resources :reviews, only: [:new, :create, :destroy]
  end
  
end
