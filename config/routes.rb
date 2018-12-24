Rails.application.routes.draw do
  root "top#index"
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
  resources :workers do 
    collection do 
      get :login
    end
  end
  resources :sale_managements
  resource :session, only: [:create,:destroy]
end
