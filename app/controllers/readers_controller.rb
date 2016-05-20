class ReadersController < ApplicationController
  before_action :authenticate_reader!

  def show
    @reader = Reader.new
    if session[:transaction_id]
      t = Transaction.find(session[:transaction_id])
      @book = Book.find(t.book_id)
      session.delete(:transaction_id)
    end
  end

  def update
    respond_to do |format|
      if current_reader.update(reader_params)
        format.html { redirect_to reader_path , notice: "Your info was succesfully updated" }
      else
        format.html { redirect_to reader_path , notice: "Something went wrong. It wasn't possible to update your info"}
      end
    end
  end

  def my_books
    @reader = Reader.find_by(id: params[:id])
    if @reader
      @books_on_sale = Book.get_books_from(@reader)
      @books_sold = Transaction.get_seller_books(@reader)
      @books_acquired = Transaction.get_buyer_books(@reader)
    else
      format.json { redirect_to reader_path, notice: "No user was found with that ID" }
    end
  end


  private
  def reader_params
    params.require(:reader).permit(:first_name, :last_name, :email, :address, :postcode, :city)
  end
end
