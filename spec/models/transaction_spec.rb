require 'rails_helper'

RSpec.describe Transaction, type: :model do

  let(:buyer) {create(:reader, credit: 40)}
  let(:seller) {create(:reader, credit: 10)}
  let(:book) {create(:book, price: 25)}

  describe '#get books from buyer' do
    before do
      @book1 = create(:book, reader: buyer)
      @book2 = create(:book, reader: buyer)
      @book3 = create(:book, reader: seller)
      Transaction.create(book: @book1, buyer: buyer,created_at: Date.today.last_week)
      Transaction.create(book: @book2, buyer: buyer,created_at: Date.today.last_month)
      Transaction.create(book: @book3, seller: buyer, created_at: Date.today.yesterday)
    end

    it 'returns all the books for a specific buyer' do
      expect(Transaction.get_buyer_books(buyer).length).to eq(2)
    end

    it 'should return the books ordered by the transactions creation' do
      expect(Transaction.get_buyer_books(buyer).first).to eq @book1
    end
  end

  describe '#get books from seller' do
    before do
      book1 = create(:book, reader: buyer)
      book2 = create(:book, reader: buyer)
      book3 = create(:book, reader: seller)
      Transaction.create(book: book1, buyer: buyer,created_at: Date.today.last_week)
      Transaction.create(book: book2, buyer: buyer,created_at: Date.today.last_month)
      Transaction.create(book: book3, buyer: buyer, seller: seller, created_at: Date.today.yesterday)
    end

    it 'returns all the books for a specific seller' do
      expect(Transaction.get_seller_books(seller).length).to eq(1)
    end
  end

  describe '#credit_update' do
    it 'makes the necessary operations to increase and decrease the credit of users' do
      Transaction.credit_update(book,buyer,seller)
      expect(buyer.credit).to eq(15)
      expect(seller.credit).to eq(35)
    end
  end

  describe '#make_transaction' do
    it 'makes a record of a new transaction' do
      t = Transaction.make_transaction(book,buyer,seller)
      expect(t).to be_instance_of(Transaction)
    end
  end
end
