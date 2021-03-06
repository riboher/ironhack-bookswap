Rails.application.routes.draw do
  devise_for :readers, path: "/"
  resources :readers

  namespace :api do
    namespace :v1 do
      get '/books/search/:isbn' => "books#isbn_search"
    end
  end

  root :to => 'books#index'

  get  '/readers/:id/my_books'        => "readers#my_books", defaults: { format: :json }
  get  '/book_query'                  => "books#book_query", defaults: { format: :json }
  get  '/book_search'                 => "books#book_search"
  get  'books/:id/reswap'             => "books#reswap", as: "reswap"
  post '/books/create'                => "books#create"
  post '/transactions/:book_id/swap'  => "transactions#swap_book", as: "swap_book"
end
