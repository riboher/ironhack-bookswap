Rails.application.routes.draw do
  devise_for :readers, controllers: { registrations: "readers/registrations" }
  resources :readers

  root :to => 'books#index'

  get '/readers/:id/mybooks' => "readers#get_user_books"
  post '/books/create' => "books#create"
  post '/transactions/:book_id/swap' => "transactions#swap_book", as: "swap_book"
end
