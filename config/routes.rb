Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :users
  devise_for :doctors

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :users do
    resources :cases
  end

  resources :doctors do
    resources :cases
  end

  resources :categories

  get 'doctors/category/:category_id', to: 'doctors#index', as: 'doctors_by_category'
  get 'landing', to: 'pages#landing_page', as: 'landing'
end
