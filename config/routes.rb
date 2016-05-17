Rails.application.routes.draw do
  devise_for :readers

  get '/all' => "books#index"
  post '/books/create' => "books#create"
end
