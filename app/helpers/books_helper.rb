module BooksHelper
  def format_author(author)
    author_full_name = author.split(",")
    formatted_name = author_full_name[1] + " " + author_full_name [0]
  end
end
