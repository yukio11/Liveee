Rails.application.routes.draw do
  devise_for :users
  root 'lives#index'
  resources :users, only: :show
  resources :lives do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end
