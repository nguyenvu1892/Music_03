Rails.application.routes.draw do
  namespace :admin do
    root to: "users#index"
    resources :songs
    resources :categories
    resources :users
    resources :albums
    resources :artists
  end
  get "/search", to: "searchs#search"
end
