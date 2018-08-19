Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :line_items
  resources :carts do
    collection do
      delete :pay
      get :location
    end
  end
  resources :products do
    collection do
      get :search
    end
  end
  get "/products/list/:user_id", to: "products#list", as: "product_list"

  get "/products/deliveries/:product_id", to: "locations#product", as: "product_locations"
  get "/users/deliveries/:user_id", to: "locations#user", as: "user_locations"
  patch "/products/deliveries/confirm/:id", to: "locations#confirm", as: "confirm_location"
  delete "/users/deliveries/dismiss/:id", to: "locations#destroy", as: "location"

  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'products#index'
  match "*path", :to => "application#routing_error", via: :all, constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
