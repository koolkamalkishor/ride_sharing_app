Rails.application.routes.draw do
  root "rides#index"

  resources :rides do
    resources :interests
  end
end
