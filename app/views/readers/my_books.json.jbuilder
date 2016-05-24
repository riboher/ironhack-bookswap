json.reader_id @reader.id
json.books do
  json.on_sale do
    json.array! @books_on_sale do |book|
      json.book do
         json.book_details book
         json.avatar_path book.avatar.url
       end
    end
  end
  json.sold do
    json.array! @books_sold do |book|
      json.book do
        json.book_details book
        json.avatar_path book.avatar.url
      end

    end
  end
  json.bought do
    json.array! @books_acquired do |book|
      json.book do
       json.book_details book
       json.avatar_path book.avatar.url
     end
    end
  end
end
