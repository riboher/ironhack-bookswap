class BooksController < ApplicationController
  before_action :authenticate_reader!, only: :create
  def index
    @selling_books = Book.get_available_books(current_reader)
    @reader = Reader.new
  end

  def create
    book = current_reader.books.create(book_params)
    if book.save
      # binding.pry
      flash[:notice] = "Genial #{current_reader.first_name}! Tu libro ha sido creado."
      redirect_to reader_path(current_reader.id)
    else
      # binding.pry
      flash[:error] = "Hmmm...algo no ha ido como debería, tu libro no ha sido guardado."
      redirect_to root_path
    end
  end

  def book_query
    keyword = params[:query].capitalize
    @books = Book.where("title LIKE ? AND is_available = ?","%#{keyword}%", true)
  end

  def book_search
    book_title = params[:title]
    @book = Book.get_book_by_title(book_title)
    respond_to do |format|
      format.html { render partial: 'partials/book', :locals  => { :book => @book } }
      format.json { render json: @book }
    end
  end

  def reswap
    book = Book.find(params[:id])
    book.update_attribute(:is_available, true)
    redirect_to reader_path(current_reader.id)
  end

  private
  def book_params
    # binding.pry
    params.require(:book).permit(:title,:author,:year,:isbn,:publisher,:description,:price,:cover,:avatar)
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
