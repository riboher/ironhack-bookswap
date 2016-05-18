class Transaction < ActiveRecord::Base
  belongs_to :buyer, class_name: 'Reader'
  belongs_to :seller, class_name: 'Reader'

  def self.get_buyer_books(reader)
    transactions = Transaction.where(buyer_id: reader.id)
    retrieve_books(transactions)
  end

  def self.get_seller_books(reader)
    where(seller_id: reader.id)
    retrieve_books(transactions)
  end


  protected
  def retrieve_books(transactions)
    books = []
    transactions.each do |t|
      books << Book.where("id = ? AND is_available =? ", t.book_id, false)
    end
    books
  end
end
