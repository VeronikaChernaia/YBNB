Rails.application.routes.draw do
  #get 'dashboard/show'
  devise_for :views
  devise_for :users
  root to: "pages#home"
  resource :user, only: [:show, :edit, :update]
  resources :yachts do
      resources :bookings, only: [:new, :create, :show, :update, :edit]
     member do
      get 'show_with_booking'
    end

  end

  get 'dashboard', to: 'dashboard#show', as: 'dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
