Rails.application.routes.draw do
  devise_for :readers, path: "/"
  resources :readers

  root :to => 'books#index'

  get '/readers/:id/my_books' => "readers#my_books", defaults: { format: :json }
  post '/books/create' => "books#create"
  post '/transactions/:book_id/swap' => "transactions#swap_book", as: "swap_book"
end
