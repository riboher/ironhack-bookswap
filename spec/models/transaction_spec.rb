require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#get books from buyer' do
    it 'returns all the books for a specific buyer' do
      buyer = create(:reader, id: 2)
      create(:book, reader_id: 2)
      create(:book, reader_id: 1)
      create(:book, reader_id: 2)
      Transaction.create(book_id: 1, buyer_id: 2, seller_id: 1)
      Transaction.create(book_id: 2, buyer_id: 1, seller_id: 2)
      Transaction.create(book_id: 3, buyer_id: 2, seller_id: 1)
      expect(Transaction.get_buyer_books(buyer).length).to eq(2)
    end
  end

  describe '#get books from seller' do
    it 'returns all the books for a specific seller' do
      seller = create(:reader, id: 2)
      create(:book, reader_id: 2)
      create(:book, reader_id: 1)
      create(:book, reader_id: 2)
      Transaction.create(book_id: 1, buyer_id: 1, seller_id: 2)
      Transaction.create(book_id: 2, buyer_id: 2, seller_id: 1)
      Transaction.create(book_id: 3, buyer_id: 2, seller_id: 1)
      expect(Transaction.get_seller_books(seller).length).to eq(1)
    end
  end
end
