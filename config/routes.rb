Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "sessions/new"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/my_demand", to: "demands#my_demand"
    get "/dashboard", to: "admin#dashboard"

    resources :users, except: %i(index destroy)
    resources :demands
    resources :teach_offers

    namespace :admin do
      resources :users
      resources :demands
      resources :teach_offers
    end
  end
end
