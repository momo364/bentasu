Rails.application.routes.draw do
  root "top#index"
  resources :customers do 
    resources :orders
    collection do 
      get :login
    end
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
  resources :boxes,only: [:create]
  resources :sale_managements
  resource :session, only: [:create,:destroy]
  resource :session_customer, only: [:create, :destroy]
end
