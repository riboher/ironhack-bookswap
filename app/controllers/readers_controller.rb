class ReadersController < ApplicationController
  before_action :authenticate_reader!
  def show
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

  def owned_books
    reader = Reader.find_by(id: params[:id])
    respond_to do |format|
      if reader
        books_on_sale = Book.get_books_from(reader)
        books_sold = Transaction.get_given_books(reader)
        books_acquired = Transaction.get_received_books(reader)
        format.json {render json: books}
      else
        format.json { redirect_to reader_path, notice: "No user was found with that ID" }
      end
    end
  end


  private
  def reader_params
    params.require(:reader).permit(:first_name, :last_name, :email, :address, :postcode, :city)
  end
end
