class Api::V1::BooksController < ApplicationController

  def isbn_search
    isbn = params[:isbn]
    uri = URI("http://www.directtextbook.com/xml.php?key=4cf4a7b1a265e7a0710c24a1d4d72df4&isbn=#{isbn}")
    res = Net::HTTP.get(uri)
    hash = Hash.from_xml(res.gsub("\n", ""))
    render xml: hash
  end
end
