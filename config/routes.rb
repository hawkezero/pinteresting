Rails.application.routes.draw do
  root "pages#home"
  get "home" => "pages#home" # creates home_path
  get "about" => "pages#about" # creates about_path

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
