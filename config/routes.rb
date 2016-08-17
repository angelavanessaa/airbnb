Rails.application.routes.draw do
  get 'payments/new'

  get 'listings/index'

  root 'welcome#index'
  resources :users, controller: "users", only: [:show, :update]


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  resources :listings do 
      resources :reservations, only: [:new]
  end
  
  resources :reservations

  resources :payments, only: [:new, :create]

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get 'welcome/index'

  get 'users/show'
  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
