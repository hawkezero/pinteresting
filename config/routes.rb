Rails.application.routes.draw do
  
  resources :pins
  devise_for :users
  root "pins#index"
  get "home" => "pages#home" # creates home_path
  get "about" => "pages#about" # creates about_path
  get "index" => "pins#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
