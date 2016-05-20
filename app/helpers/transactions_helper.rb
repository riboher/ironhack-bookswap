module TransactionsHelper
  def get_bookswap_count(reader)
    Transaction.get_buyer_books(reader).count
  end
end
