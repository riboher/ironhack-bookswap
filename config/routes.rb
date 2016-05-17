Rails.application.routes.draw do
  devise_for :readers
  resources :readers

  root :to => 'books#index'

  get '/all' => "books#index"
  post '/books/create' => "books#create"
end
