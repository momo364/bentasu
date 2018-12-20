Rails.application.routes.draw do
  root "dishes#index"
  resources :customers do 
    resources :orders
  end
  resources :dishes
  resources :orders do 
    resources :boxes
  end
  resources :box_kinds do
    resources :boxes
  end
  resources :workers
  resources :sale_managements
end
