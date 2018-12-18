Rails.application.routes.draw do
  root "dishes#index"

  resources :dishes
end
