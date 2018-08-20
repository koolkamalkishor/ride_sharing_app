Rails.application.routes.draw do

  devise_for :users

  root "rides#index"

  resources :rides do
    resources :interests
  end
end
