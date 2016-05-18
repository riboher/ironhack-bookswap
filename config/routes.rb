Rails.application.routes.draw do
  devise_for :readers
  resources :readers

  root :to => 'books#index'

  get '/readers/:id/mybooks' => "readers#get_user_books"
  post '/books/create' => "books#create"
end
