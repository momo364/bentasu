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
    resources :sale_managements
    member { patch :select,:unselect,:dish_params,:stop,:start }
    collection { get :selected ,:index_noselect,:search}
  end
  resources :orders do 
    resources :boxes
    member { patch :finish } 
    collection do
      get :kitchen_index,:complete
    end
  end
  resources :box_kinds
  resources :workers do 
    collection do 
      get :login
    end
  end
  resources :boxes,only: [:create,:destroy]
  resources :sale_managements
  resource :session, only: [:create,:destroy]
  resource :session_customer, only: [:create, :destroy]
end
