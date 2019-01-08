Rails.application.routes.draw do
  root "top#index"
  resources :customers do 
    resources :orders
    collection do 
      get :login
      get :history
    end
  end
  resources :dishes do
    member { patch :select,:unselect,:dish_params }
    collection { get :selected }
  end
  resources :orders do 
    resources :boxes
    member { patch :complete } 
    collection do
      get :kitchen_index
    end
  end
  resources :box_kinds
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
