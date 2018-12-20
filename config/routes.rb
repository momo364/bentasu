Rails.application.routes.draw do
  root "dishes#index"
  resources :customers do 
    resources :orders
  end
  resources :dishes
end
