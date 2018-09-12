Rails.application.routes.draw do

  namespace :admin do
    root 'application#index'

    resources :rides, only: [:new, :create, :destroy]
    resources :users do
      member do
        patch :archive
      end
    end
  end
  devise_for :users

  root "rides#home"

  resources :rides do
    resources :interests
  end

  post '/', :to => 'rides#add_ride'
end
