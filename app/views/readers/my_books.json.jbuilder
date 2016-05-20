json.reader_id @reader.id
json.books do
  json.on_sale @books_on_sale
  json.sold  @books_sold
  json.bought @books_acquired
end
