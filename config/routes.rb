Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/groups" => "groups#index"
  post "/groups" => "groups#create"
  delete "/groups/:id" => "groups#destroy"

  get "/messages" => "messages#index"
  post "/messages" => "messages#create"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/contacts" => "contacts#index"
  get "/contacts/find" => "contacts#find"
  post "/contacts" => "contacts#create"

  patch "/users/:id" => "users#update"
end
