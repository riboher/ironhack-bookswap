# Preview all emails at http://localhost:3000/rails/mailers/reader_mailer
class ReaderMailerPreview < ActionMailer::Preview
  def swap_mail_preview
    ReaderMailer.swap_mail(Book.first)
  end
end
