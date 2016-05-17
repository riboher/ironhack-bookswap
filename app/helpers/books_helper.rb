module BooksHelper
  def format_author(author)
    author_full_name = author.split(",")
    author_full_name[1] + " " + author_full_name [0] unless author_full_name.length == 1
  end
end
