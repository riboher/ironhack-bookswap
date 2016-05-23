class ReaderMailer < ApplicationMailer
  default from: "hola@bookswap.com"
  def swap_mail(book)
    @book = book
    @book_owner = @book.reader
    mail(to: @book_owner.email, subject: """Hola #{@book_owner.first_name}!
      Alguien ha hecho Swap a tu libro #{book.title}""")
  end
end
