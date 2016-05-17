class BooksController < ApplicationController
  before_action :authenticate_reader!, except: [ :index, :create ]
  def index
    @selling_books = Book.get_available_books(current_reader)
    @reader = Reader.new
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

  def resource_name
    :reader
  end
  helper_method :resource_name

  def resource
    @resource ||= Reader.new
  end
  helper_method :resource

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:reader]
  end
  helper_method :devise_mapping

  def resource_class
    Reader
  end
  helper_method :resource_class

end
