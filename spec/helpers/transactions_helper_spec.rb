require 'rails_helper'

RSpec.describe TransactionsHelper, type: :helper do
  describe 'get bookswap count' do
    it 'returns the number of books that a user has bookswapped' do
      buyer = create(:reader)
      seller = create(:reader)
      book = create(:book, reader: buyer)
      Transaction.make_transaction(book,buyer,seller)
      expect(get_bookswap_count(buyer)). to eq 1
    end
  end
end
