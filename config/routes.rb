Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  patch 'users/:id' => 'users#update', as: 'update_user'
  resources :users
  resources :books
  #get 'users/show'
  #get 'users/edit'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
