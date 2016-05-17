Rails.application.routes.draw do
  devise_for :readers, controllers: {
        registrations: 'readers/registrations'
      }
  resources :readers

  root :to => 'books#index'

  get '/all' => "books#index"
  post '/books/create' => "books#create"
end
