Rails.application.routes.draw do
  devise_for :readers
  resources :readers

  root :to => 'books#index'

  get '/readers/:id/owned_books' => "readers#owned_books"
  post '/books/create' => "books#create"
end
