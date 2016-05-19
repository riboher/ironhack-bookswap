module BooksHelper
  def format_author(author)
    author_full_name = author.split(",")
    author_full_name[1] + " " + author_full_name [0] unless author_full_name.length == 1
  end

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
end
