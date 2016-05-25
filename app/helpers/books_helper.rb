module BooksHelper
  def format_owner_name(first_name,last_name)
    if last_name != nil
      first_name + last_name.split("")[0]
    else
      first_name
    end
  end

  def compare_credit(price,credit)
    price > credit ? true : false
  end

  def check_avatar(book)
    book.avatar_file_name != nil ? book.avatar : book.cover
  end
end
