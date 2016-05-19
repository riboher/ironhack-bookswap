class TransactionsController < ApplicationController


  def swap_book
    binding.pry
    book = Book.find(params[:book_id])
    seller = book.reader
    if book.has_ownership?(seller) && current_reader.has_credit?(book)
      transaction = Transaction.make_transaction(book,current_reader,seller)
      respond_to do |format|
        if transaction.save
          format.html { redirect_to reader_path(current_reader.id), notice: "Congrats! You acquired a book!" }
        else
          format.html { redirect_to root_path, notice: "The purchase was not completed" }
        end
      end
    end
  end
end
