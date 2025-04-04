Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :line_items, only: [:create, :update, :destroy]

  resources :products
  resources :orders, only: [:create, :show, :update]
  resources :carts, only: [:show, :destroy] do
  member do
    get :payment
  end
end
  resources :transactions, only: [:index, :show]
 post 'carts/:cart_id/process_payment', to: 'carts#process_payment', as: 'process_payment'
end
