class Transaction < ActiveRecord::Base
  belongs_to :buyer, class_name: 'Reader'
  belongs_to :seller, class_name: 'Reader'
  belongs_to :book

  def self.get_buyer_books(reader)
   Book.joins(:transactions).where("buyer_id = ? AND books.is_available = ?",reader.id,false).order('transactions.created_at desc')
  end

  def self.get_seller_books(reader)
    Book.joins(:transactions).where("seller_id = ? AND books.is_available = ?",reader.id,false).order('transactions.created_at desc')
  end

  def self.credit_update(book,buyer,seller)
    buyer.update_attribute(:credit, buyer.credit - book.price)
    seller.update_attribute(:credit, seller.credit + book.price)
  end

  def self.make_transaction(book,buyer,seller)
    book.update_attribute(:is_available, false)
    ReaderMailer.swap_mail(book).deliver_now
    book.change_ownership(buyer)
    self.credit_update(book,buyer,seller)
    Transaction.create(book_id: book.id, buyer_id: buyer.id, seller_id: seller.id)
  end
end
