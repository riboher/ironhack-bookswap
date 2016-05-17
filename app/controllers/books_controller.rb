class BooksController < ApplicationController
  before_action :authenticate_reader!, except: [ :index, :create ]
  def index
    @selling_books = Book.get_available_books(current_reader)
  end

  def create
    book = current_reader.books.create(book_params)

    respond_to do |format|
      if book.save
        format.html { redirect_to edit_reader_password_path , notice: "Your book was succesfully created" }
      else
        format.html { redirect_to all_path , notice: "Something went wrong. It wasn't possible to create the book"}
      end
    end
  end

  private
  def book_params
    params.require(:book).permit(:title,:author,:year,:isbn,:publisher,:description,:price,:cover)
  end

end
