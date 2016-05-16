class BooksController < ApplicationController
  before_action :authenticate_reader!, except: :index
  def index
    @selling_books = Book.get_available_books(current_reader)
  end
end
