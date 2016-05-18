class Transaction < ActiveRecord::Base
  belongs_to :buyer, class_name: 'Reader'
  belongs_to :seller, class_name: 'Reader'

  def self.get_buyer_books(reader)
   Book.joins(:transactions).where("buyer_id = ?",reader.id)
  end

  def self.get_seller_books(reader)
    Book.joins(:transactions).where("seller_id = ?",reader.id)
  end
end
