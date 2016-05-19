require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#get books from buyer' do
    it 'returns all the books for a specific buyer' do
      buyer = create(:reader, id: 2)
      create(:book, reader_id: 2, id: 1)
      create(:book, reader_id: 1, id: 2)
      create(:book, reader_id: 2, id: 3)
      Transaction.create(book_id: 1, buyer_id: 2, seller_id: 1)
      Transaction.create(book_id: 2, buyer_id: 1, seller_id: 2)
      Transaction.create(book_id: 3, buyer_id: 2, seller_id: 1)
      expect(Transaction.get_buyer_books(buyer).length).to eq(2)
    end
  end

  describe '#get books from seller' do
    it 'returns all the books for a specific seller' do
      seller = create(:reader, id: 2)
      create(:book, reader_id: 2, id: 1)
      create(:book, reader_id: 1, id: 2)
      create(:book, reader_id: 2, id: 3)
      Transaction.create(book_id: 1, buyer_id: 1, seller_id: 2)
      Transaction.create(book_id: 2, buyer_id: 2, seller_id: 1)
      Transaction.create(book_id: 3, buyer_id: 2, seller_id: 1)
      expect(Transaction.get_seller_books(seller).length).to eq(1)
    end
  end

  describe '#credit_update' do
    it 'makes the necessary operations to increase and decrease the credit of users' do
      book = build(:book, price: 25)
      buyer = build(:reader, credit: 40)
      seller = build(:reader, credit: 10)
      Transaction.credit_update(book,buyer,seller)
      expect(buyer.credit).to eq(15)
      expect(seller.credit).to eq(35)
    end
  end

  describe '#make_transaction' do
    it 'makes a record of a new transaction' do
      book = create(:book)
      buyer = create(:reader)
      seller = create(:reader)
      t = Transaction.make_transaction(book,buyer,seller)
      expect(t).to be_instance_of(Transaction)
    end

    it 'has the appropriate attributes' do
      t = create(:transaction, seller_id: 5, buyer_id: 3, book_id: 34)
      expect(t.seller_id).to eq(5)
      expect(t.buyer_id).to eq(3)
      expect(t.book_id).to eq(34)
    end
  end
end
